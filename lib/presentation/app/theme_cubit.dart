import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/constants/key_constants.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

@lazySingleton
class ThemeCubit extends BaseCubit<ThemeState> {
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs) : super(_loadInitialState(_prefs));

  static ThemeState _loadInitialState(SharedPreferences prefs) {
    final themeIndex =
        prefs.getInt(KeyConstants.themeMode) ?? ThemeMode.system.index;
    final seedColorValue = prefs.getInt(KeyConstants.seedColor);
    final seedColor = seedColorValue != null
        ? Color(seedColorValue)
        : AppColors.seed;

    final customSeedColorValue = prefs.getInt(KeyConstants.customSeedColor);
    final customSeedColor = customSeedColorValue != null
        ? Color(customSeedColorValue)
        : null;

    return ThemeState(
      themeMode: ThemeMode.values[themeIndex],
      seedColor: seedColor,
      customSeedColor: customSeedColor,
    );
  }

  void updateTheme({required ThemeMode mode}) {
    _prefs.setInt(KeyConstants.themeMode, mode.index);
    safeEmit(state.copyWith(themeMode: mode));
  }

  void updateSeedColor({required Color color, bool isCustom = false}) {
    _prefs.setInt(KeyConstants.seedColor, color.toARGB32());
    if (isCustom) {
      _prefs.setInt(KeyConstants.customSeedColor, color.toARGB32());
      safeEmit(state.copyWith(seedColor: color, customSeedColor: color));
    } else {
      safeEmit(state.copyWith(seedColor: color));
    }
  }

  void toggleTheme() {
    if (state.themeMode == ThemeMode.light) {
      updateTheme(mode: ThemeMode.dark);
    } else {
      updateTheme(mode: ThemeMode.light);
    }
  }
}
