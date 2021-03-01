import 'package:email_validator/email_validator.dart' as x;

class EmailValidator {

  static bool validate(String email) {
    return x.EmailValidator.validate(email);
  }

}

class PasswordValidator {

  static bool validate(String password, [String passwordAgain]) {
    if(passwordAgain != null) {
      if(password != passwordAgain) {
        return false;
      }
    }
    return _validate(password);
  }

  static bool _validate(String password) {
    // Check >= 6 letters
    // TODO more complex passwords
    if(password.length < 6) {
      return false;
    }
    return true;
  }

}