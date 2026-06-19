import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sylva/core/enums/load_status.dart';

class PhotoPreviewState extends Equatable {
  final LoadStatus getColorStatus;
  final List<Color> paletteColors;

  const PhotoPreviewState({
    this.paletteColors = const [],
    this.getColorStatus = LoadStatus.initial,
  });

  PhotoPreviewState copyWith({
    List<Color>? paletteColors,
    LoadStatus? getColorStatus,
  }) {
    return PhotoPreviewState(
      paletteColors: paletteColors ?? this.paletteColors,
      getColorStatus: getColorStatus ?? this.getColorStatus,
    );
  }

  @override
  List<Object?> get props => [paletteColors, getColorStatus];
}
