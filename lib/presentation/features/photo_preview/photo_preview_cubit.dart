import 'dart:io';
import 'package:flutter/material.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import 'package:sylva/core/enums/load_status.dart';
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
}
