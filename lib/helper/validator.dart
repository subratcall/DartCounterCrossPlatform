import 'package:dart_counter/app_errors.dart';
import 'package:email_validator/email_validator.dart' as x;

class EmailValidator {
  static bool validate(String email) {
    return validateError(email) == null;
  }

  static Error validateError(String email) {
    if(email == null) return EmptyEmailAddressError();
    if(!x.EmailValidator.validate(email.trim())) return InvalidEmailAddressError();
    return null;
  }
}

class PasswordValidator {
  static bool validate(String password, String passwordAgain) {
    return validateError(password, passwordAgain) == null;
  }

  static Error validateError(String password, String passwordAgain) {
    if (password == null) return EmptyPasswordError();
    if (passwordAgain == null) return EmptyPasswordAgainError();

    var trimmedPassword = password.trim();
    if (trimmedPassword != passwordAgain.trim()) return PasswordNotEqualPasswordAgainError();

    return _validate(trimmedPassword);
  }

  static Error _validate(String password) {
    // Check >= 6 letters
    // TODO only allow more complex passwords, only allow certain characters
    if (password.length < 6) return PasswordToShortError();
    if (password.length < 32) return PasswordToLongError();
    return null;
  }
}

class UsernameValidator {
  static bool validate(String username) {
    return validateError(username) == null;
  }

  static Error validateError(String username) {
    if(username == null) return EmptyUsernameError();
    if(username.length < 3) return UsernameToShortError();
    if(username.length < 12) return UsernameToLongError();
    if(false) return InvalidUsernameError(); // TODO invalid characters used only [A-z][0-9] allowed
    return null;
  }
}
