import 'package:sylva/generated/l10n.dart';

/// Utility class for data validation including email, password, etc.
class ValidateUtils {
  /// Regular expression for validating an email address.
  static final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Regular expression for validating a password.
  /// Requires at least 8 characters, 1 uppercase, 1 lowercase, 1 number, and 1 special character.
  static final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  /// Validates a user's name, checking if it is empty or too short.
  static String? validateName({String? value}) {
    if (value == null || value.isEmpty) {
      return S.current.nameRequired;
    }
    if (value.length < 2) {
      return S.current.nameLength;
    }
    return null;
  }

  /// Validates an email address against [emailRegex].
  static String? validateEmail({String? value}) {
    if (value == null || value.isEmpty) {
      return S.current.emailRequired;
    }
    if (!emailRegex.hasMatch(value)) {
      return S.current.emailInvalid;
    }
    return null;
  }

  /// Validates a password against [passwordRegex].
  static String? validatePassword({String? value}) {
    if (value == null || value.isEmpty) {
      return S.current.passwordRequired;
    }
    if (!passwordRegex.hasMatch(value)) {
      return S.current.passwordLength;
    }
    return null;
  }

  /// Validates if the confirm password matches the original password.
  static String? validateConfirmPassword({String? value, String? password}) {
    if (value == null || value.isEmpty) {
      return S.current.confirmPasswordRequired;
    }
    if (value != password) {
      return S.current.passwordsDoNotMatch;
    }
    return null;
  }
}
