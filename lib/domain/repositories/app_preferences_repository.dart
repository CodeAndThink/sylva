abstract class AppPreferencesRepository {
  // App
  bool get isFirstTime;
  Future<void> setFirstTime(bool value);

  // Interaction
  bool get isHapticEnabled;
  Future<void> setHapticEnabled(bool value);
  bool get isSoundEnabled;
  Future<void> setSoundEnabled(bool value);

  // Locale
  String get languageCode;
  Future<void> setLanguageCode(String code);

  // Theme
  int get themeModeIndex;
  Future<void> setThemeModeIndex(int index);
  int? get seedColorValue;
  Future<void> setSeedColorValue(int value);
  int? get customSeedColorValue;
  Future<void> setCustomSeedColorValue(int value);
  bool get isCustomSeedColor;
  Future<void> setIsCustomSeedColor(bool value);

  // Share Fonts
  List<String> get downloadedFonts;
  Future<void> setDownloadedFonts(List<String> fonts);
}
