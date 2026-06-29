import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:sylva/core/enums/template_enums.dart';

enum ShareFeatureTab {
  focus,
  shapes,
  colors,
  direction;

  bool get isFocus => this == ShareFeatureTab.focus;
  bool get isShapes => this == ShareFeatureTab.shapes;
  bool get isColors => this == ShareFeatureTab.colors;
  bool get isDirection => this == ShareFeatureTab.direction;
}

class ShareState extends Equatable {
  final Set<Color> selectedColors;
  final ShareFeatureTab currentTab;
  final PaletteShape selectedShape;
  final PalettePosition selectedPosition;
  final PaletteDirection selectedDirection;

  const ShareState({
    this.selectedColors = const {},
    this.currentTab = ShareFeatureTab.colors,
    this.selectedShape = PaletteShape.none,
    this.selectedPosition = PalettePosition.center,
    this.selectedDirection = PaletteDirection.vertical,
  });

  ShareState copyWith({
    Set<Color>? selectedColors,
    ShareFeatureTab? currentTab,
    PaletteShape? selectedShape,
    PalettePosition? selectedPosition,
    PaletteDirection? selectedDirection,
  }) {
    return ShareState(
      selectedColors: selectedColors ?? this.selectedColors,
      currentTab: currentTab ?? this.currentTab,
      selectedShape: selectedShape ?? this.selectedShape,
      selectedPosition: selectedPosition ?? this.selectedPosition,
      selectedDirection: selectedDirection ?? this.selectedDirection,
    );
  }

  @override
  List<Object?> get props => [
    selectedColors,
    currentTab,
    selectedShape,
    selectedPosition,
    selectedDirection,
  ];
}
