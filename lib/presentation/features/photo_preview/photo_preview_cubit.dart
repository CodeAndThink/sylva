import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:path/path.dart' as p;
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/services/permission_service.dart';
import 'package:sylva/core/utils/file_utils.dart';
import 'package:sylva/data/entities/history_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_page.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_state.dart';
import 'package:sylva/presentation/features/share/share_page.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';
import 'package:sylva/core/exceptions/app_failures.dart';

class PhotoPreviewCubit extends BaseCubit<PhotoPreviewState> {
  final PhotoPreviewNavigator navigator;
  Isolate? _filterIsolate;

  PhotoPreviewCubit({
    required this.navigator,
    List<Color>? initialColors,
    Color? initialSelectedColor,
  }) : super(const PhotoPreviewState());

  void init({required PhotoPreviewArguments args}) {
    extractPalette(imagePath: args.imagePath);
    safeEmit(
      state.copyWith(
        imagePath: args.imagePath,
        userColors: args.initialColors ?? const [],
        selectedColor: args.initialSelectedColor,
        historyRecordId: args.historyRecordId,
      ),
    );
  }

  @override
  Future<void> close() {
    _filterIsolate?.kill(priority: Isolate.immediate);
    return super.close();
  }

  void setSelectedColor({required Color color}) {
    safeEmit(state.copyWith(selectedColor: color));
  }

  void clearSelectedColor() {
    safeEmit(
      state.copyWith(
        selectedColor: null,
        filteredImageBytes: null,
        filterColorStatus: LoadStatus.initial,
      ),
    );
  }

  void saveUserColor({required Color color}) {
    final updatedUserColors = List<Color>.from(state.userColors);
    if (!updatedUserColors.contains(color)) {
      updatedUserColors.insert(0, color);
    } else {
      updatedUserColors.remove(color);
      updatedUserColors.insert(0, color);
    }

    safeEmit(
      state.copyWith(selectedColor: color, userColors: updatedUserColors),
    );
  }

  Future<void> extractPalette({required String imagePath}) async {
    if (state.getColorStatus.isLoading) return;
    safeEmit(state.copyWith(getColorStatus: LoadStatus.loading));
    await Future.delayed(2.seconds);
    try {
      final PaletteGeneratorMaster generator =
          await PaletteGeneratorMaster.fromImageProvider(
            FileImage(File(imagePath)),
          );

      final List<Color> colors = [];
      if (generator.dominantColor != null) {
        colors.add(generator.dominantColor!.color);
      }
      if (generator.vibrantColor != null) {
        colors.add(generator.vibrantColor!.color);
      }
      if (generator.mutedColor != null) {
        colors.add(generator.mutedColor!.color);
      }
      if (generator.darkVibrantColor != null) {
        colors.add(generator.darkVibrantColor!.color);
      }
      if (generator.lightVibrantColor != null) {
        colors.add(generator.lightVibrantColor!.color);
      }
      if (generator.darkMutedColor != null) {
        colors.add(generator.darkMutedColor!.color);
      }
      if (generator.lightMutedColor != null) {
        colors.add(generator.lightMutedColor!.color);
      }

      // Remove duplicates
      final uniqueColors = colors.toSet().toList();

      if (uniqueColors.isEmpty) {
        throw Exception('No colors extracted');
      }

      safeEmit(
        state.copyWith(
          paletteColors: uniqueColors,
          getColorStatus: LoadStatus.success,
        ),
      );
    } catch (e) {
      debugPrint('Error extracting palette: $e');
      safeEmit(state.copyWith(getColorStatus: LoadStatus.failure));
    }
  }

  Future<void> filterColor(
    String imagePath,
    Color targetColor, {
    Color? replacementColor,
  }) async {
    // Hủy isolate cũ nếu đang chạy để ưu tiên thao tác mới
    _filterIsolate?.kill(priority: Isolate.immediate);
    _filterIsolate = null;

    // Toggle off if the same color is tapped
    if (state.selectedColor == targetColor) {
      safeEmit(
        state.copyWith(
          selectedColor: null,
          filteredImageBytes: null,
          filterColorStatus: LoadStatus.initial,
        ),
      );
      return;
    }

    safeEmit(
      state.copyWith(
        filterColorStatus: LoadStatus.loading,
        selectedColor: targetColor,
      ),
    );

    try {
      final receivePort = ReceivePort();
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'targetColorValue': targetColor.toARGB32(),
        'threshold': 10.0, // RGB distance threshold
        'replacementColorValue': replacementColor?.toARGB32(),
        'sendPort': receivePort.sendPort,
      };

      _filterIsolate = await Isolate.spawn(_processImageIsolate, params);

      final result = await receivePort.first;
      receivePort.close();
      _filterIsolate = null;

      if (result is Uint8List) {
        safeEmit(
          state.copyWith(
            filteredImageBytes: result,
            filterColorStatus: LoadStatus.success,
          ),
        );
      } else if (result is Exception || result is Error) {
        throw result;
      }
    } catch (e) {
      debugPrint('Error filtering color: $e');
      safeEmit(state.copyWith(filterColorStatus: LoadStatus.failure));
    }
  }

  void copyColorToClipboard({Color? color}) {
    if (color == null) {
      navigator.flushBar.showError(message: S.current.nothingSelectedToCopy);
      return;
    }
    try {
      final rgbaString = ColorUtils.colorToRgba(color: color);
      Clipboard.setData(ClipboardData(text: rgbaString));
      navigator.flushBar.showSuccess(
        message: S.current.colorCopiedSuccess(rgbaString),
      );
    } catch (e) {
      debugPrint('Error copying color: $e');
      navigator.flushBar.showError(message: S.current.colorCopiedFailure);
    }
  }

  void copyColor(Color color) {
    try {
      final hexString = ColorUtils.colorToHex(color: color);
      Clipboard.setData(ClipboardData(text: hexString));
      navigator.flushBar.showSuccess(
        message: S.current.colorCopiedSuccess(hexString),
      );
    } catch (e) {
      debugPrint('Error copying color: $e');
      navigator.flushBar.showError(message: S.current.colorCopiedFailure);
    }
  }

  Future<void> saveHistory({required String imagePath}) async {
    try {
      final isar = locator<Isar>();
      final userColors = state.userColors.map((c) => c.toARGB32()).toList();
      final record = HistoryRecord(
        imagePath: imagePath,
        userColors: userColors,
        selectedColor: state.selectedColor?.toARGB32(),
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.historyRecords.put(record);
      });

      navigator.flushBar.showSuccess(message: S.current.success);
    } catch (e) {
      debugPrint('Error saving history: $e');
      navigator.flushBar.showError(
        message: AppFailures.mapErrorToMessage(e: e),
      );
    }
  }

  Future<void> updateHistory({
    required String imagePath,
    required int id,
  }) async {
    try {
      final isar = locator<Isar>();
      final userColors = state.userColors.map((c) => c.toARGB32()).toList();
      final record = HistoryRecord(
        imagePath: imagePath,
        userColors: userColors,
        selectedColor: state.selectedColor?.toARGB32(),
        createdAt: DateTime.now(),
      )..id = id;

      await isar.writeTxn(() async {
        await isar.historyRecords.put(record);
      });

      navigator.flushBar.showSuccess(message: S.current.success);
    } catch (e) {
      debugPrint('Error updating history: $e');
      navigator.flushBar.showError(
        message: AppFailures.mapErrorToMessage(e: e),
      );
    }
  }

  Future<void> saveToLibrary({required String imagePath}) async {
    final permissionService = locator<PermissionService>();
    final hasPermission = await permissionService.requestPhotoPermission(
      navigator.context,
    );

    if (!hasPermission) return;

    try {
      bool success = false;
      final extension = p.extension(imagePath);
      final ext = extension.isNotEmpty ? extension : '.jpg';

      if (state.filteredImageBytes != null) {
        success = await FileUtils.saveImageToLibrary(
          bytes: state.filteredImageBytes!,
          titlePrefix: 'sylva_filter',
          extension: ext,
        );
      } else {
        final file = File(imagePath);
        final bytes = await file.readAsBytes();
        success = await FileUtils.saveImageToLibrary(
          bytes: bytes,
          titlePrefix: 'sylva',
          extension: ext,
        );
      }

      if (success) {
        navigator.flushBar.showSuccess(message: S.current.imageSaved);
      } else {
        navigator.flushBar.showError(
          message: AppFailures.mapErrorToMessage(
            e: Exception('Failed to save image'),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error saving to library: $e');
      navigator.flushBar.showError(
        message: AppFailures.mapErrorToMessage(e: e),
      );
    }
  }

  void navigateToShare() {
    if (state.imagePath == null) {
      navigator.flushBar.showError(message: S.current.noImageToShare);
      return;
    }
    final List<Color> colors = [...state.userColors, ...state.paletteColors];
    navigator.navigateToShare(
      args: ShareArguments(imagePath: state.imagePath!, colors: colors),
    );
  }
}

Future<void> _processImageIsolate(Map<String, dynamic> params) async {
  final SendPort sendPort = params['sendPort'];
  try {
    final String path = params['imagePath'];
    final int colorValue = params['targetColorValue'];
    final double threshold = params['threshold'];
    final int? replacementColorValue = params['replacementColorValue'];

    final targetR = (colorValue >> 16) & 0xFF;
    final targetG = (colorValue >> 8) & 0xFF;
    final targetB = colorValue & 0xFF;

    // Use squared threshold to avoid expensive math.sqrt in the loop
    final double thresholdSq = threshold * threshold;

    final bytes = File(path).readAsBytesSync();
    final image = img.decodeImage(bytes);
    if (image == null) {
      sendPort.send(bytes);
      return;
    }

    // Scale down if image is too large to speed up preview processing
    img.Image processImage = image;
    if (image.width > 1200 || image.height > 1200) {
      processImage = img.copyResize(image, width: 1080);
    }

    // Pre-calculate replacement colors to avoid bitwise ops inside the loop
    final num? repR = replacementColorValue != null
        ? (replacementColorValue >> 16) & 0xFF
        : null;
    final num? repG = replacementColorValue != null
        ? (replacementColorValue >> 8) & 0xFF
        : null;
    final num? repB = replacementColorValue != null
        ? replacementColorValue & 0xFF
        : null;

    for (var pixel in processImage) {
      final num r = pixel.r;
      final num g = pixel.g;
      final num b = pixel.b;

      final num dr = r - targetR;
      final num dg = g - targetG;
      final num db = b - targetB;

      // Fast distance squared calculation
      final num distSq = (dr * dr) + (dg * dg) + (db * db);

      if (distSq > thresholdSq) {
        if (repR != null && repG != null && repB != null) {
          pixel.r = repR;
          pixel.g = repG;
          pixel.b = repB;
        } else {
          // Fast inline grayscale conversion (luminance)
          final num luminance = r * 0.299 + g * 0.587 + b * 0.114;
          pixel.r = luminance;
          pixel.g = luminance;
          pixel.b = luminance;
        }
      }
    }

    sendPort.send(img.encodeJpg(processImage, quality: 85));
  } catch (e) {
    sendPort.send(Exception(e.toString()));
  }
}
