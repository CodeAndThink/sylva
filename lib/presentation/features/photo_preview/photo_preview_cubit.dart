import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/utils/color_utils.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class PhotoPreviewCubit extends BaseCubit<PhotoPreviewState> {
  final PhotoPreviewNavigator navigator;

  PhotoPreviewCubit({required this.navigator})
    : super(const PhotoPreviewState());

  void setSelectedColor({required Color color}) {
    safeEmit(state.copyWith(selectedColor: color));
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
    if (state.filterColorStatus.isLoading) return;

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
      final Map<String, dynamic> params = {
        'imagePath': imagePath,
        'targetColorValue': targetColor.toARGB32(),
        'threshold': 10.0, // RGB distance threshold
        'replacementColorValue': replacementColor?.toARGB32(),
      };

      final Uint8List result = await compute(_processImageIsolate, params);

      safeEmit(
        state.copyWith(
          filteredImageBytes: result,
          filterColorStatus: LoadStatus.success,
        ),
      );
    } catch (e) {
      debugPrint('Error filtering color: $e');
      safeEmit(state.copyWith(filterColorStatus: LoadStatus.failure));
    }
  }

  void copyColorToClipboard({required Color color}) {
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
}

Uint8List _processImageIsolate(Map<String, dynamic> params) {
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
  if (image == null) return bytes;

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

  return img.encodeJpg(processImage, quality: 85);
}
