extension StringExtension on String {
  /// Check if the email format is valid
  bool get isValidEmail {
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return emailRegExp.hasMatch(this);
  }

  /// Check if the password is valid (e.g., at least 6 characters)
  bool get isValidPassword => length >= 6;

  /// Capitalize the first letter of the string
  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Capitalize the first letter of each word
  String get capitalizeAllWords {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalizeFirst).join(' ');
  }
}

extension NullableStringExtension on String? {
  /// Check if the string is null or empty
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  /// Check if the string is not null and not empty
  bool get isNotNullOrEmpty => this != null && this!.trim().isNotEmpty;
}
