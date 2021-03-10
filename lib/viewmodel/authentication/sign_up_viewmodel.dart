import 'package:dart_counter/api/authentication_service.dart';
import 'package:dart_counter/api/database_service.dart';
import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

enum SignUpViewState { idle, loading }

class SignUpViewModel extends ViewModel<SignUpViewState> {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  bool _emailIsValid = true;
  bool _usernameIsValid = true;
  bool _passwordIsValid = true;
  bool _passwordAgainIsValid = true;

  SignUpViewModel() {
    viewState = SignUpViewState.idle;
  }

  Future<void> onRegisterPressed({String email, String username, String password, String passwordAgain}) async {
    emailIsValid = EmailValidator.validate(email);
    usernameIsValid = UsernameValidator.validate(username);
    passwordIsValid = PasswordValidator.validate(password);
    passwordAgainIsValid = PasswordValidator.validate(password, passwordAgain);

    if (emailIsValid && usernameIsValid && passwordIsValid && passwordAgainIsValid) {
      viewState = SignUpViewState.loading;
      try {
        await _authenticationService.signUp(email: email, password: password, onSuccess: (uid) {
          _databaseService.createUser(uid, username);
        });

        viewState = SignUpViewState.idle;
      } on Error catch (e) {
        viewState = SignUpViewState.idle;
        throw e;
      }
    } else {
      if (!emailIsValid) {
        throw InvalidEmailAddressError();
      } else if (!usernameIsValid) {
        throw InvalidUsernameError();
      } else if (!passwordIsValid) {
        throw InvalidPasswordError();
      } else {
        throw new PasswordNotEqualPasswordAgainError();
      }
    }
  }

  bool get emailIsValid => _emailIsValid;

  bool get usernameIsValid => _usernameIsValid;

  bool get passwordIsValid => _passwordIsValid;

  bool get passwordAgainIsValid => _passwordAgainIsValid;

  set emailIsValid(bool emailIsValid) {
    _emailIsValid = emailIsValid;
    notifyListeners();
  }

  set usernameIsValid(bool usernameIsValid) {
    _usernameIsValid = usernameIsValid;
    notifyListeners();
  }

  set passwordIsValid(bool passwordIsValid) {
    _passwordIsValid = passwordIsValid;
    notifyListeners();
  }

  set passwordAgainIsValid(bool passwordAgainIsValid) {
    _passwordAgainIsValid = passwordAgainIsValid;
    notifyListeners();
  }
}
