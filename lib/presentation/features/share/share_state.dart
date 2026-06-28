import 'dart:ui';

import 'package:equatable/equatable.dart';

class ShareState extends Equatable {
  final List<Color> selectedColors;

  const ShareState({this.selectedColors = const []});

  ShareState copyWith({List<Color>? selectedColors}) {
    return ShareState(selectedColors: selectedColors ?? this.selectedColors);
  }

  @override
  List<Object?> get props => [selectedColors];
}
