import 'dart:async';

import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class SignInViewModel extends ViewModel {
  /// INPUT
  Sink<String> get inputEmail;
  Sink<String> get inputPassword;
  Future<void> onSignInPressed();
}

class SignInViewModelImpl extends SignInViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  BehaviorSubject<String> _emailController = BehaviorSubject();
  BehaviorSubject<String> _passwordController = BehaviorSubject();

  /// INPUT
  @override
  Sink<String> get inputEmail => _emailController;

  @override
  Sink<String> get inputPassword => _passwordController;

  @override
  Future<void> onSignInPressed() async {
    if (!_emailController.hasValue ||
        !_passwordController.hasValue ||
        !EmailValidator.validate(_emailController.value)) {
      throw InvalidEmailAddressOrPasswordError();
    }

    try {
      inputViewState.add(ViewState.loading);
      await _authenticationService.signIn(
          email: _emailController.value, password: _passwordController.value);
    } on Error catch (e) {
      inputViewState.add(ViewState.idle);
      throw e;
    }
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
