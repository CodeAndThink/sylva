import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/template_enums.dart';

class ShareState extends Equatable {
  final Set<Color> selectedColors;
  final ShareFeatureTab currentTab;
  final PaletteShape selectedShape;
  final PalettePosition selectedPosition;
  final PaletteDirection selectedDirection;
  final double shapeSize;
  final double shapeSpacing;
  final double shapeMargin;

  final ShareTextOption textOption;
  final ShareTextPosition textPosition;
  final double textSize;
  final bool isTextBold;
  final bool isTextItalic;
  final bool isTextUnderline;
  final Color? textColor;
  final String textFontFamily;
  final List<String> downloadedFonts;
  final Set<String> downloadingFonts;

  const ShareState({
    this.selectedColors = const {},
    this.currentTab = ShareFeatureTab.colors,
    this.selectedShape = PaletteShape.none,
    this.selectedPosition = PalettePosition.center,
    this.selectedDirection = PaletteDirection.vertical,
    this.shapeSize = 0.2,
    this.shapeSpacing = 0.2,
    this.shapeMargin = 0.0,
    this.textOption = ShareTextOption.none,
    this.textPosition = ShareTextPosition.bottom,
    this.textSize = 0.5,
    this.isTextBold = false,
    this.isTextItalic = false,
    this.isTextUnderline = false,
    this.textColor,
    this.textFontFamily = 'Nunito',
    this.downloadedFonts = const ['Nunito'],
    this.downloadingFonts = const {},
  });

  ShareState copyWith({
    Set<Color>? selectedColors,
    ShareFeatureTab? currentTab,
    PaletteShape? selectedShape,
    PalettePosition? selectedPosition,
    PaletteDirection? selectedDirection,
    double? shapeSize,
    double? shapeSpacing,
    double? shapeMargin,
    ShareTextOption? textOption,
    ShareTextPosition? textPosition,
    double? textSize,
    bool? isTextBold,
    bool? isTextItalic,
    bool? isTextUnderline,
    Color? textColor,
    bool clearTextColor = false,
    String? textFontFamily,
    List<String>? downloadedFonts,
    Set<String>? downloadingFonts,
  }) {
    return ShareState(
      selectedColors: selectedColors ?? this.selectedColors,
      currentTab: currentTab ?? this.currentTab,
      selectedShape: selectedShape ?? this.selectedShape,
      selectedPosition: selectedPosition ?? this.selectedPosition,
      selectedDirection: selectedDirection ?? this.selectedDirection,
      shapeSize: shapeSize ?? this.shapeSize,
      shapeSpacing: shapeSpacing ?? this.shapeSpacing,
      shapeMargin: shapeMargin ?? this.shapeMargin,
      textOption: textOption ?? this.textOption,
      textPosition: textPosition ?? this.textPosition,
      textSize: textSize ?? this.textSize,
      isTextBold: isTextBold ?? this.isTextBold,
      isTextItalic: isTextItalic ?? this.isTextItalic,
      isTextUnderline: isTextUnderline ?? this.isTextUnderline,
      textColor: clearTextColor ? null : (textColor ?? this.textColor),
      textFontFamily: textFontFamily ?? this.textFontFamily,
      downloadedFonts: downloadedFonts ?? this.downloadedFonts,
      downloadingFonts: downloadingFonts ?? this.downloadingFonts,
    );
  }

  @override
  List<Object?> get props => [
    selectedColors,
    currentTab,
    selectedShape,
    selectedPosition,
    selectedDirection,
    shapeSize,
    shapeSpacing,
    shapeMargin,
    textOption,
    textPosition,
    textSize,
    isTextBold,
    isTextItalic,
    isTextUnderline,
    textColor,
    textFontFamily,
    downloadedFonts,
    downloadingFonts,
  ];
}
