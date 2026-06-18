import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

    return ThemeState(themeMode: ThemeMode.values[themeIndex]);
  }

  void updateTheme({required ThemeMode mode}) {
    _prefs.setInt(KeyConstants.themeMode, mode.index);
    safeEmit(state.copyWith(themeMode: mode));
  }

  void toggleTheme() {
    if (state.themeMode == ThemeMode.light) {
      updateTheme(mode: ThemeMode.dark);
    } else {
      updateTheme(mode: ThemeMode.light);
    }
  }
}
