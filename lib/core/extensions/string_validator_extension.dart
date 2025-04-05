import 'package:quick_opd/core/utils/regex_validator.dart';

extension StringValidatorExtension on String {
  bool get isEmailValid => RegexValidator.email.hasMatch(this);

  bool get isPasswordValid => RegexValidator.password.hasMatch(this);
  bool get isMobileValid => RegexValidator.mobile.hasMatch(this);
  bool get isTextNumber => RegexValidator.firstLetterNumber.hasMatch(this);
  bool get isTextAlphabet => RegexValidator.firstLetterAlphaBet.hasMatch(this);
  bool get validateURLs => RegexValidator.validUrl.hasMatch(this);

  static String? isEmailMobileValid(String value) {
    if (value.isEmpty) {
      return "Please enter email or mobile no.";
    }
    if (value.isTextNumber) {
      if (value.length == 10 && value.isMobileValid) {
        return null;
      } else {
        return 'Please enter a valid mobile no.';
      }
    }
    if (value.isTextAlphabet) {
      if (value.isEmailValid) {
        return null;
      } else {
        return 'Please enter a valid email address.';
      }
    }
    return null;
  }

  static String? passwordValid(String value) {
    if (value.isEmpty) {
      return "Password field is empty.";
    }
    if (value.length < 6 || value.length > 15) {
      return "Password must be between 6 and 15 characters.";
    }
    if (value.isPasswordValid) {
      return null;
    } else {
      return "Invalid Password";
    }
  }

  static String? validateMobile(String value) {
    if (value.length == 10 && value.isMobileValid) {
      return null;
    } else if (value.isEmpty) {
      return 'Mobile number is empty';
    } else {
      return 'Please enter a valid mobile number.';
    }
  }
}
