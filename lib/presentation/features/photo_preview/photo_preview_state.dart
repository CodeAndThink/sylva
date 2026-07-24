import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sylva/core/enums/load_status.dart';

class PhotoPreviewState extends Equatable {
  final LoadStatus getColorStatus;
  final LoadStatus filterColorStatus;
  final LoadStatus saveStatus;
  final List<Color> paletteColors;
  final List<Color> userColors;
  final Color? selectedColor;
  final Color? filteredColor;
  final Uint8List? filteredImageBytes;
  final String? imagePath;
  final int? historyRecordId;

  const PhotoPreviewState({
    this.paletteColors = const [],
    this.userColors = const [],
    this.getColorStatus = LoadStatus.initial,
    this.filterColorStatus = LoadStatus.initial,
    this.saveStatus = LoadStatus.initial,
    this.selectedColor,
    this.filteredColor,
    this.filteredImageBytes,
    this.imagePath,
    this.historyRecordId,
  });

  PhotoPreviewState copyWith({
    List<Color>? paletteColors,
    List<Color>? userColors,
    LoadStatus? getColorStatus,
    LoadStatus? filterColorStatus,
    LoadStatus? saveStatus,
    Color? selectedColor,
    bool clearSelectedColor = false,
    Color? filteredColor,
    Uint8List? filteredImageBytes,
    String? imagePath,
    int? historyRecordId,
  }) {
    return PhotoPreviewState(
      paletteColors: paletteColors ?? this.paletteColors,
      userColors: userColors ?? this.userColors,
      getColorStatus: getColorStatus ?? this.getColorStatus,
      filterColorStatus: filterColorStatus ?? this.filterColorStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      selectedColor: clearSelectedColor
          ? null
          : (selectedColor ?? this.selectedColor),
      filteredColor: filterColorStatus == LoadStatus.initial
          ? null
          : (filteredColor ?? this.filteredColor),
      filteredImageBytes: filterColorStatus == LoadStatus.initial
          ? null
          : (filteredImageBytes ?? this.filteredImageBytes),
      imagePath: imagePath ?? this.imagePath,
      historyRecordId: historyRecordId ?? this.historyRecordId,
    );
  }

  @override
  List<Object?> get props => [
    paletteColors,
    userColors,
    getColorStatus,
    filterColorStatus,
    saveStatus,
    selectedColor,
    filteredColor,
    filteredImageBytes,
    imagePath,
    historyRecordId,
  ];
}
