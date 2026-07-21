import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

@lazySingleton
class ThemeCubit extends BaseCubit<ThemeState> {
  final AppPreferencesRepository _appPrefs;

  ThemeCubit(this._appPrefs) : super(_loadInitialState(_appPrefs));

  static ThemeState _loadInitialState(AppPreferencesRepository prefs) {
    final themeIndex = prefs.themeModeIndex;
    final seedColorValue = prefs.seedColorValue;
    final seedColor = seedColorValue != null
        ? Color(seedColorValue)
        : AppColors.seed;

    final customSeedColorValue = prefs.customSeedColorValue;
    final customSeedColor = customSeedColorValue != null
        ? Color(customSeedColorValue)
        : null;

    final isCustomSeedColor = prefs.isCustomSeedColor;

    return ThemeState(
      themeMode: ThemeMode.values[themeIndex],
      seedColor: seedColor,
      customSeedColor: customSeedColor,
      isCustomSeedColor: isCustomSeedColor,
    );
  }

  void updateTheme({required ThemeMode mode}) {
    _appPrefs.setThemeModeIndex(mode.index);
    safeEmit(state.copyWith(themeMode: mode));
  }

  void updateSeedColor({required Color color, bool isCustom = false}) {
    _appPrefs.setSeedColorValue(color.toARGB32());
    _appPrefs.setIsCustomSeedColor(isCustom);
    if (isCustom) {
      _appPrefs.setCustomSeedColorValue(color.toARGB32());
      safeEmit(
        state.copyWith(
          seedColor: color,
          customSeedColor: color,
          isCustomSeedColor: true,
        ),
      );
    } else {
      safeEmit(state.copyWith(seedColor: color, isCustomSeedColor: false));
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
