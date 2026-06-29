import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/template_enums.dart';

enum ShareFeatureTab {
  focus,
  shapes,
  colors,
  direction,
  text;

  bool get isFocus => this == ShareFeatureTab.focus;
  bool get isShapes => this == ShareFeatureTab.shapes;
  bool get isColors => this == ShareFeatureTab.colors;
  bool get isDirection => this == ShareFeatureTab.direction;
  bool get isText => this == ShareFeatureTab.text;
}

class ShareState extends Equatable {
  final Set<Color> selectedColors;
  final ShareFeatureTab currentTab;
  final PaletteShape selectedShape;
  final PalettePosition selectedPosition;
  final PaletteDirection selectedDirection;
  final double shapeSize;
  final double shapeSpacing;

  final ShareTextOption textOption;
  final ShareTextPosition textPosition;
  final double textSize;
  final bool isTextBold;
  final bool isTextItalic;
  final bool isTextUnderline;
  final Color? textColor;

  const ShareState({
    this.selectedColors = const {},
    this.currentTab = ShareFeatureTab.colors,
    this.selectedShape = PaletteShape.none,
    this.selectedPosition = PalettePosition.center,
    this.selectedDirection = PaletteDirection.vertical,
    this.shapeSize = 0.2,
    this.shapeSpacing = 0.2,
    this.textOption = ShareTextOption.none,
    this.textPosition = ShareTextPosition.bottom,
    this.textSize = 0.5,
    this.isTextBold = false,
    this.isTextItalic = false,
    this.isTextUnderline = false,
    this.textColor,
  });

  ShareState copyWith({
    Set<Color>? selectedColors,
    ShareFeatureTab? currentTab,
    PaletteShape? selectedShape,
    PalettePosition? selectedPosition,
    PaletteDirection? selectedDirection,
    double? shapeSize,
    double? shapeSpacing,
    ShareTextOption? textOption,
    ShareTextPosition? textPosition,
    double? textSize,
    bool? isTextBold,
    bool? isTextItalic,
    bool? isTextUnderline,
    Color? textColor,
    bool clearTextColor = false,
  }) {
    return ShareState(
      selectedColors: selectedColors ?? this.selectedColors,
      currentTab: currentTab ?? this.currentTab,
      selectedShape: selectedShape ?? this.selectedShape,
      selectedPosition: selectedPosition ?? this.selectedPosition,
      selectedDirection: selectedDirection ?? this.selectedDirection,
      shapeSize: shapeSize ?? this.shapeSize,
      shapeSpacing: shapeSpacing ?? this.shapeSpacing,
      textOption: textOption ?? this.textOption,
      textPosition: textPosition ?? this.textPosition,
      textSize: textSize ?? this.textSize,
      isTextBold: isTextBold ?? this.isTextBold,
      isTextItalic: isTextItalic ?? this.isTextItalic,
      isTextUnderline: isTextUnderline ?? this.isTextUnderline,
      textColor: clearTextColor ? null : (textColor ?? this.textColor),
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
    textOption,
    textPosition,
    textSize,
    isTextBold,
    isTextItalic,
    isTextUnderline,
    textColor,
  ];
}
