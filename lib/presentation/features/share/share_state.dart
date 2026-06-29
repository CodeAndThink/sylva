import 'dart:ui';

import 'package:equatable/equatable.dart';

enum ShareFeatureTab {
  focus,
  shapes,
  colors;

  bool get isFocus => this == ShareFeatureTab.focus;
  bool get isShapes => this == ShareFeatureTab.shapes;
  bool get isColors => this == ShareFeatureTab.colors;
}

class ShareState extends Equatable {
  final Set<Color> selectedColors;
  final ShareFeatureTab currentTab;

  const ShareState({
    this.selectedColors = const {},
    this.currentTab = ShareFeatureTab.colors,
  });

  ShareState copyWith({
    Set<Color>? selectedColors,
    ShareFeatureTab? currentTab,
  }) {
    return ShareState(
      selectedColors: selectedColors ?? this.selectedColors,
      currentTab: currentTab ?? this.currentTab,
    );
  }

  @override
  List<Object?> get props => [selectedColors, currentTab];
}
