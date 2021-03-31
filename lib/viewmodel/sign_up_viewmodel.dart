import 'dart:async';

import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class SignUpViewModel extends ViewModel {

  bool emailIsValid;
  bool usernameIsValid;
  bool passwordIsValid;
  bool passwordAgainIsValid;

  Future<void> onRegisterPressed({String email, String username, String password, String passwordAgain});
}

class SignUpViewModelImpl implements SignUpViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  final StreamController<ViewState> _viewStateController = StreamController.broadcast();

  bool emailIsValid = true;
  bool usernameIsValid = true;
  bool passwordIsValid = true;
  bool passwordAgainIsValid = true;

  SignUpViewModel() {
    _viewStateController.add(ViewState.idle);
  }

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  Future<void> onRegisterPressed({String email, String username, String password, String passwordAgain}) async {
    emailIsValid = EmailValidator.validate(email);
    usernameIsValid = UsernameValidator.validate(username);
    passwordIsValid = PasswordValidator.validate(password);
    passwordAgainIsValid = PasswordValidator.validate(password, passwordAgain);

    if (emailIsValid &&
        usernameIsValid &&
        passwordIsValid &&
        passwordAgainIsValid) {
      _viewStateController.add(ViewState.loading);
      try {
        await _authenticationService.signUp(
            email: email,
            password: password,
            onSuccess: (uid) {
              _databaseService.createUser(uid, username);
            });

        _viewStateController.add(ViewState.idle);
      } on Error catch (e) {
        _viewStateController.add(ViewState.idle);
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

  @override
  void dispose() {
    _viewStateController.close();
  }
}