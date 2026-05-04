import 'package:flutter_porto_smkid/core/validators/validators_ppatterns.dart';

import '../errors/errors_validators.dart';

class Validators {
  static String? validateEmail(String value) {
    if (value.isEmpty) return ValidationErrors.emailEmpty;
    if (!RegexPatterns.email.hasMatch(value)) {
      return ValidationErrors.emailInvalid;
    }
    if (value.length > 100) return ValidationErrors.emailTooLong;
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return ValidationErrors.passwordEmpty;
    if (value.length < 6) return ValidationErrors.passwordTooShort;
    if (value.length > 20) return ValidationErrors.passwordTooLong;
    if (!value.contains(RegExp(r'[0-9]'))) {
      return ValidationErrors.passwordNoNumber;
    }
    return null;
  }

  static String? validateConfirmPassword(String password, String confirm) {
    if (confirm.isEmpty) return ValidationErrors.passwordEmpty;
    if (password != confirm) return ValidationErrors.confirmPasswordNotMatch;
    return null;
  }
}
