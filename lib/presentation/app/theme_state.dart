import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final Color seedColor;
  final Color? customSeedColor;
  final bool isCustomSeedColor;

  const ThemeState({
    this.themeMode = ThemeMode.system,
    this.seedColor = AppColors.seed,
    this.customSeedColor,
    this.isCustomSeedColor = false,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    Color? seedColor,
    Color? customSeedColor,
    bool? isCustomSeedColor,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      seedColor: seedColor ?? this.seedColor,
      customSeedColor: customSeedColor ?? this.customSeedColor,
      isCustomSeedColor: isCustomSeedColor ?? this.isCustomSeedColor,
    );
  }

  @override
  List<Object?> get props => [
    themeMode,
    seedColor,
    customSeedColor,
    isCustomSeedColor,
  ];
}
