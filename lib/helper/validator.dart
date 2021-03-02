import 'package:email_validator/email_validator.dart' as x;

class EmailValidator {
  static bool validate(String email) {
    return x.EmailValidator.validate(email.trim());
  }
}

class PasswordValidator {
  static bool validate(String password, [String passwordAgain]) {
    if (password == null) return false;

    var trimmedPassword = password.trim();

    if (passwordAgain != null) {
      if (trimmedPassword != passwordAgain.trim()) {
        return false;
      }
    }
    return _validate(trimmedPassword);
  }

  static bool _validate(String password) {
    // Check >= 6 letters
    // TODO more complex passwords
    if (password.length < 6) {
      return false;
    }
    return true;
  }
}

class UsernameValidator {
  static bool validate(String username) {
    // TODO implement: min 3 Zeichen aus [A-z][0-9]
    return true;
  }
}
