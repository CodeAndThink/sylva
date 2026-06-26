import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final Color seedColor;

  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.seedColor = AppColors.seed,
  });

  ThemeState copyWith({ThemeMode? themeMode, Color? seedColor}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      seedColor: seedColor ?? this.seedColor,
    );
  }

  @override
  List<Object?> get props => [themeMode, seedColor];
}
