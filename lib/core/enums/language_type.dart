enum LanguageType {
  en,
  vi,
  ja,
  zh;

  bool get isEnglish => this == LanguageType.en;
  bool get isVietnamese => this == LanguageType.vi;
  bool get isJapanese => this == LanguageType.ja;
  bool get isChinese => this == LanguageType.zh;

  String get locale {
    switch (this) {
      case LanguageType.en:
        return 'en_US';
      case LanguageType.vi:
        return 'vi_VN';
      case LanguageType.ja:
        return 'ja_JP';
      case LanguageType.zh:
        return 'zh_CN';
    }
  }

  String get name {
    switch (this) {
      case LanguageType.en:
        return 'English';
      case LanguageType.vi:
        return 'Tiếng Việt';
      case LanguageType.ja:
        return '日本語';
      case LanguageType.zh:
        return '中文';
    }
  }

  String get value {
    switch (this) {
      case LanguageType.en:
        return 'en';
      case LanguageType.vi:
        return 'vi';
      case LanguageType.ja:
        return 'ja';
      case LanguageType.zh:
        return 'zh';
    }
  }

  String get flag {
    switch (this) {
      case LanguageType.en:
        return '🇺🇸';
      case LanguageType.vi:
        return '🇻🇳';
      case LanguageType.ja:
        return '🇯🇵';
      case LanguageType.zh:
        return '🇨🇳';
    }
  }
}
