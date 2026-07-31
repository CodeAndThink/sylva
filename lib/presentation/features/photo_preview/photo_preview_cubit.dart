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
import 'package:sylva/data/models/process_image_model.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_page.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_state.dart';
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
    safeEmit(state.copyWith(clearSelectedColor: true));
  }

  void clearFilterColor() {
    safeEmit(
      state.copyWith(
        filteredColor: null,
        filteredImageBytes: null,
        filterColorStatus: LoadStatus.initial,
      ),
    );
  }

  void deleteUserColor({required Color color}) {
    final updatedUserColors = List<Color>.from(state.userColors);
    updatedUserColors.remove(color);
    safeEmit(state.copyWith(userColors: updatedUserColors));
  }

  void saveUserColor({required Color color}) {
    final updatedUserColors = List<Color>.from(state.userColors);
    if (!updatedUserColors.contains(color)) {
      updatedUserColors.insert(0, color);
    } else {
      updatedUserColors.remove(color);
      updatedUserColors.insert(0, color);
    }

    safeEmit(state.copyWith(userColors: updatedUserColors));
  }

  Future<void> extractPalette({required String imagePath}) async {
    if (state.getColorStatus.isLoading) return;
    safeEmit(state.copyWith(getColorStatus: LoadStatus.loading));
    await Future.delayed(2.seconds);
    try {
      final PaletteGeneratorMaster generator =
          await PaletteGeneratorMaster.fromImageProvider(
            FileImage(File(imagePath)),
            maximumColorCount: 16,
          );

      final List<Color> targetColors = [];
      if (generator.dominantColor != null) {
        targetColors.add(generator.dominantColor!.color);
      }
      if (generator.vibrantColor != null) {
        targetColors.add(generator.vibrantColor!.color);
      }
      if (generator.mutedColor != null) {
        targetColors.add(generator.mutedColor!.color);
      }
      if (generator.darkVibrantColor != null) {
        targetColors.add(generator.darkVibrantColor!.color);
      }
      if (generator.lightVibrantColor != null) {
        targetColors.add(generator.lightVibrantColor!.color);
      }
      if (generator.darkMutedColor != null) {
        targetColors.add(generator.darkMutedColor!.color);
      }
      if (generator.lightMutedColor != null) {
        targetColors.add(generator.lightMutedColor!.color);
      }

      final List<Color> allExtractedColors = generator.colors.toList();
      final combinedColors = [...targetColors, ...allExtractedColors];

      // Remove duplicates
      final uniqueColors = combinedColors.toSet().toList();

      uniqueColors.sort((a, b) {
        final hsvA = HSVColor.fromColor(a);
        final hsvB = HSVColor.fromColor(b);

        final bool isGrayA = hsvA.saturation < 0.15;
        final bool isGrayB = hsvB.saturation < 0.15;

        if (isGrayA && !isGrayB) return 1;
        if (!isGrayA && isGrayB) return -1;

        if (isGrayA && isGrayB) {
          return hsvA.value.compareTo(hsvB.value);
        }

        final int hueBucketA = (hsvA.hue / 15).round();
        final int hueBucketB = (hsvB.hue / 15).round();

        if (hueBucketA != hueBucketB) {
          return hueBucketA.compareTo(hueBucketB);
        }

        final int valueCompare = hsvA.value.compareTo(hsvB.value);
        if (valueCompare != 0) {
          return valueCompare;
        }

        return hsvA.saturation.compareTo(hsvB.saturation);
      });

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
    _filterIsolate?.kill(priority: Isolate.immediate);
    _filterIsolate = null;

    // Toggle off if the same color is tapped
    if (state.filteredColor == targetColor) {
      clearFilterColor();
      return;
    }

    safeEmit(
      state.copyWith(
        filterColorStatus: LoadStatus.loading,
        filteredColor: targetColor,
      ),
    );

    try {
      final receivePort = ReceivePort();
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'targetColorValue': targetColor.toARGB32(),
        'threshold': 30.0, // RGB distance threshold
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

  /// Returns true if save succeeded, false otherwise.
  Future<bool> saveHistory({required String imagePath}) async {
    if (state.saveStatus.isLoading) return false;
    safeEmit(state.copyWith(saveStatus: LoadStatus.loading));
    try {
      final isar = locator<Isar>();
      final localImagePath = await FileUtils.saveCompressedImageToAppDirectory(
        imagePath,
      );
      final userColors = state.userColors.map((c) => c.toARGB32()).toList();
      final record = HistoryRecord(
        imagePath: localImagePath,
        userColors: userColors,
        selectedColor: state.filteredColor?.toARGB32(),
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.historyRecords.put(record);
      });

      safeEmit(state.copyWith(saveStatus: LoadStatus.success));
      navigator.flushBar.showSuccess(message: S.current.success);
      return true;
    } catch (e) {
      debugPrint('Error saving history: $e');
      safeEmit(state.copyWith(saveStatus: LoadStatus.failure));
      navigator.flushBar.showError(
        message: AppFailures.mapErrorToMessage(e: e),
      );
      return false;
    }
  }

  /// Returns true if update succeeded, false otherwise.
  Future<bool> updateHistory({
    required String imagePath,
    required int id,
  }) async {
    if (state.saveStatus.isLoading) return false;
    safeEmit(state.copyWith(saveStatus: LoadStatus.loading));
    try {
      final isar = locator<Isar>();
      final userColors = state.userColors.map((c) => c.toARGB32()).toList();
      final originalRecord = await isar.historyRecords.get(id);

      // Reuse the existing image path from the original record to avoid
      // re-copying the file. Only fall back to the passed-in path if
      // the original record is missing.
      final record = HistoryRecord(
        imagePath: originalRecord?.imagePath ?? imagePath,
        userColors: userColors,
        selectedColor: state.filteredColor?.toARGB32(),
        createdAt: DateTime.now(),
        isFavorite: originalRecord?.isFavorite ?? false,
      )..id = id;

      await isar.writeTxn(() async {
        await isar.historyRecords.put(record);
      });

      safeEmit(state.copyWith(saveStatus: LoadStatus.success));
      navigator.flushBar.showSuccess(message: S.current.success);
      return true;
    } catch (e) {
      debugPrint('Error updating history: $e');
      safeEmit(state.copyWith(saveStatus: LoadStatus.failure));
      navigator.flushBar.showError(
        message: AppFailures.mapErrorToMessage(e: e),
      );
      return false;
    }
  }

  Future<void> saveToLibrary({required String imagePath}) async {
    if (state.saveStatus.isLoading) return;

    final permissionService = locator<PermissionService>();
    final hasPermission = await permissionService.requestPhotoPermission(
      navigator.context,
    );

    if (!hasPermission) return;

    safeEmit(state.copyWith(saveStatus: LoadStatus.loading));
    try {
      final extension = p.extension(imagePath);
      final ext = extension.isNotEmpty ? extension : '.jpg';

      if (state.filteredImageBytes != null) {
        await FileUtils.saveImageToLibrary(
          bytes: state.filteredImageBytes!,
          titlePrefix: 'sylva_filter',
          extension: ext,
        );
      } else {
        final compressedBytes = await FileUtils.compressImageToBytes(imagePath);
        final bytes = compressedBytes ?? await File(imagePath).readAsBytes();
        await FileUtils.saveImageToLibrary(
          bytes: bytes,
          titlePrefix: 'sylva',
          extension: ext,
        );
      }

      safeEmit(state.copyWith(saveStatus: LoadStatus.success));
      navigator.flushBar.showSuccess(message: S.current.imageSaved);
    } catch (e) {
      debugPrint('Error saving to library: $e');
      safeEmit(state.copyWith(saveStatus: LoadStatus.failure));
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
    navigator.navigateToShare(
      args: ProcessImageModel(
        imagePath: state.imagePath!,
        genColors: state.paletteColors,
        userColors: state.userColors,
      ),
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
