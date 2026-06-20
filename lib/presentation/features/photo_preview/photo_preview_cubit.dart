import 'dart:io';
import 'dart:math' as math;
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

  Future<void> extractPalette(String imagePath) async {
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
        'threshold': 30.0, // RGB distance threshold
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

  final bytes = File(path).readAsBytesSync();
  final image = img.decodeImage(bytes);
  if (image == null) return bytes;

  // Scale down if image is too large to speed up preview processing
  img.Image processImage = image;
  if (image.width > 1200 || image.height > 1200) {
    processImage = img.copyResize(image, width: 1080);
  }

  for (var pixel in processImage) {
    final r = pixel.r;
    final g = pixel.g;
    final b = pixel.b;

    final dist = math.sqrt(
      math.pow(r - targetR, 2) +
          math.pow(g - targetG, 2) +
          math.pow(b - targetB, 2),
    );

    if (dist > threshold) {
      if (replacementColorValue != null) {
        pixel.r = (replacementColorValue >> 16) & 0xFF;
        pixel.g = (replacementColorValue >> 8) & 0xFF;
        pixel.b = replacementColorValue & 0xFF;
      } else {
        // Convert to grayscale
        final luminance = img.getLuminance(pixel);
        pixel.r = luminance;
        pixel.g = luminance;
        pixel.b = luminance;
      }
    }
  }

  return img.encodeJpg(processImage, quality: 85);
}
