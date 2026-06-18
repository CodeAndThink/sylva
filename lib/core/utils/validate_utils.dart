import 'package:sylva/generated/l10n.dart';

class ValidateUtils {
  static final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  static String? validateName({String? value}) {
    if (value == null || value.isEmpty) {
      return S.current.nameRequired;
    }
    if (value.length < 2) {
      return S.current.nameLength;
    }
    return null;
  }

  static String? validateEmail({String? value}) {
    if (value == null || value.isEmpty) {
      return S.current.emailRequired;
    }
    if (!emailRegex.hasMatch(value)) {
      return S.current.emailInvalid;
    }
    return null;
  }

  static String? validatePassword({String? value}) {
    if (value == null || value.isEmpty) {
      return S.current.passwordRequired;
    }
    if (!passwordRegex.hasMatch(value)) {
      return S.current.passwordLength;
    }
    return null;
  }

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
