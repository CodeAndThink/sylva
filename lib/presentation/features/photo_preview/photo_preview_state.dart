import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sylva/core/enums/load_status.dart';

class PhotoPreviewState extends Equatable {
  final LoadStatus getColorStatus;
  final LoadStatus filterColorStatus;
  final List<Color> paletteColors;
  final Color? selectedColor;
  final Uint8List? filteredImageBytes;

  const PhotoPreviewState({
    this.paletteColors = const [],
    this.getColorStatus = LoadStatus.initial,
    this.filterColorStatus = LoadStatus.initial,
    this.selectedColor,
    this.filteredImageBytes,
  });

  PhotoPreviewState copyWith({
    List<Color>? paletteColors,
    LoadStatus? getColorStatus,
    LoadStatus? filterColorStatus,
    Color? selectedColor,
    Uint8List? filteredImageBytes,
  }) {
    return PhotoPreviewState(
      paletteColors: paletteColors ?? this.paletteColors,
      getColorStatus: getColorStatus ?? this.getColorStatus,
      filterColorStatus: filterColorStatus ?? this.filterColorStatus,
      // If selectedColor is explicitly passed as null, it will be ignored by ??
      // To allow nulling it out, we'd normally use a wrapped value, but since
      // we only null it out when filterColorStatus == initial, we can infer it
      // or just use a workaround. Wait, let's keep it simple:
      selectedColor: filterColorStatus == LoadStatus.initial
          ? null
          : (selectedColor ?? this.selectedColor),
      filteredImageBytes: filterColorStatus == LoadStatus.initial
          ? null
          : (filteredImageBytes ?? this.filteredImageBytes),
    );
  }

  @override
  List<Object?> get props => [
    paletteColors,
    getColorStatus,
    filterColorStatus,
    selectedColor,
    filteredImageBytes,
  ];
}
