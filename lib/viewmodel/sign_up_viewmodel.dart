import 'dart:async';

import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class SignUpViewModel extends ViewModel {

  /// INPUT
  Sink<String> get inputEmail;
  Sink<String> get inputUsername;
  Sink<String> get inputPassword;
  Sink<String> get inputPasswordAgain;
  Future<void> onRegisterPressed();

  /// OUTPUT
  Stream<Error> get outputErrorEmail;
  Stream<Error> get outputErrorUsername;
  Stream<Error> get outputErrorPassword;
  Stream<Error> get outputErrorPasswordAgain;
}

class SignUpViewModelImpl extends SignUpViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  BehaviorSubject<String> _emailController = BehaviorSubject();
  BehaviorSubject<String> _usernameController = BehaviorSubject();
  BehaviorSubject<String> _passwordController = BehaviorSubject();
  BehaviorSubject<String> _passwordAgainController = BehaviorSubject();
  bool _isRegisterButtonEnabled() {
    bool emailValid = outputErrorEmail.hasValue && outputErrorEmail.value == null ? true : false;
    bool usernameValid = outputErrorUsername.hasValue && outputErrorUsername.value == null ? true : false;
    bool passwordValid = outputErrorPassword.hasValue && outputErrorPassword.value == null ? true : false;
    bool passwordAgainValid = outputErrorPasswordAgain.hasValue && outputErrorPasswordAgain.value == null ? true : false;

    return emailValid && usernameValid && passwordValid && passwordAgainValid;
  }

  /// INPUT
  @override
  Sink<String> get inputEmail => _emailController;

  @override
  Sink<String> get inputUsername => _usernameController;

  @override
  Sink<String> get inputPassword => _passwordController;

  @override
  Sink<String> get inputPasswordAgain => _passwordAgainController;

  @override
  Future<void> onRegisterPressed() async {
    try {
      inputViewState.add(ViewState.loading);
      await _authenticationService.signUp(email: _emailController.stream.value, password: _passwordController.stream.value);
      _databaseService.createUser(_authenticationService.user.uid, _usernameController.value);
    } on Error catch(e) {
      inputViewState.add(ViewState.idle);
      throw e;
    }
  }

  /// OUTPUT
  @override
  ValueStream<Error> get outputErrorEmail => _emailController.stream
      .map((email) => Error()); // TODO

  @override
  ValueStream<Error> get outputErrorUsername => _usernameController.stream
      .map((username) => Error()); // TODO

  @override
  ValueStream<Error> get outputErrorPassword => _passwordController.stream
      .map((password) => Error()); // TODO

  @override
  ValueStream<Error> get outputErrorPasswordAgain => _passwordAgainController.stream
      .map((passwordAgain) => Error()); // TODO

  @override
  void dispose() {
    _emailController.close();
    _usernameController.close();
    _passwordController.close();
    _passwordAgainController.close();
    super.dispose();
  }

}