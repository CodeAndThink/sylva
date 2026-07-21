import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/core/constants/key_constants.dart';
import 'package:sylva/core/enums/language_type.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';

@LazySingleton(as: AppPreferencesRepository)
class AppPreferencesRepositoryImpl implements AppPreferencesRepository {
  final SharedPreferences _prefs;

  AppPreferencesRepositoryImpl(this._prefs);

  @override
  bool get isFirstTime => _prefs.getBool(KeyConstants.isFirstTime) ?? true;

  @override
  Future<void> setFirstTime(bool value) =>
      _prefs.setBool(KeyConstants.isFirstTime, value);

  @override
  bool get isHapticEnabled =>
      _prefs.getBool(KeyConstants.hapticEnabled) ?? true;

  @override
  Future<void> setHapticEnabled(bool value) =>
      _prefs.setBool(KeyConstants.hapticEnabled, value);

  @override
  bool get isSoundEnabled => _prefs.getBool(KeyConstants.soundEnabled) ?? true;

  @override
  Future<void> setSoundEnabled(bool value) =>
      _prefs.setBool(KeyConstants.soundEnabled, value);

  @override
  String get languageCode =>
      _prefs.getString(KeyConstants.languageCode) ?? LanguageType.en.value;

  @override
  Future<void> setLanguageCode(String code) =>
      _prefs.setString(KeyConstants.languageCode, code);

  @override
  int get themeModeIndex =>
      _prefs.getInt(KeyConstants.themeMode) ?? ThemeMode.system.index;

  @override
  Future<void> setThemeModeIndex(int index) =>
      _prefs.setInt(KeyConstants.themeMode, index);

  @override
  int? get seedColorValue => _prefs.getInt(KeyConstants.seedColor);

  @override
  Future<void> setSeedColorValue(int value) =>
      _prefs.setInt(KeyConstants.seedColor, value);

  @override
  int? get customSeedColorValue => _prefs.getInt(KeyConstants.customSeedColor);

  @override
  Future<void> setCustomSeedColorValue(int value) =>
      _prefs.setInt(KeyConstants.customSeedColor, value);

  @override
  bool get isCustomSeedColor =>
      _prefs.getBool(KeyConstants.isCustomSeedColor) ?? false;

  @override
  Future<void> setIsCustomSeedColor(bool value) =>
      _prefs.setBool(KeyConstants.isCustomSeedColor, value);

  @override
  List<String> get downloadedFonts =>
      _prefs.getStringList(KeyConstants.downloadedFonts) ?? ['Nunito'];

  @override
  Future<void> setDownloadedFonts(List<String> fonts) =>
      _prefs.setStringList(KeyConstants.downloadedFonts, fonts);
}
