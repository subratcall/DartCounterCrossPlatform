import 'dart:async';

import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/services/authentication/authentication_service.dart';
import 'package:dart_counter/services/database/database_service.dart';
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
  final AuthenticationService _authenticationService = AuthenticationService.instance;
  final DatabaseService _databaseService = DatabaseService.instance;

  BehaviorSubject<String> _emailController = BehaviorSubject();
  BehaviorSubject<String> _usernameController = BehaviorSubject();
  BehaviorSubject<String> _passwordController = BehaviorSubject();
  BehaviorSubject<String> _passwordAgainController = BehaviorSubject();

  bool _allValid() {
    return EmailValidator.validate(_emailController.value) &&
        UsernameValidator.validate(_usernameController.value) &&
        PasswordValidator.validate(_passwordController.value) &&
        _passwordController.value == _passwordAgainController.value;
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
    if (_allValid()) {
      try {
        inputViewState.add(ViewState.loading);
        await _authenticationService.signUp(_emailController.stream.value, _passwordController.stream.value);
        _databaseService.createUser(_usernameController.value);
      } on Error catch (e) {
        inputViewState.add(ViewState.idle);
        throw e;
      }
    } else {
      throw InvalidFormDataError();
    }
  }

  /// OUTPUT
  @override
  ValueStream<Error> get outputErrorEmail =>
      ValueConnectableStream(_emailController.stream.map((email) =>
              email == '' ? null : EmailValidator.validateError(email)))
          .autoConnect();

  @override
  ValueStream<Error> get outputErrorUsername => ValueConnectableStream(
      _usernameController.stream.map((username) => username == ''
          ? null
          : UsernameValidator.validateError(username))).autoConnect();

  @override
  ValueStream<Error> get outputErrorPassword => ValueConnectableStream(
          _passwordController.stream.map((password) => password == ''
              ? null
              : PasswordValidator.validateError(_passwordController.value)))
      .autoConnect();

  @override
  ValueStream<Error> get outputErrorPasswordAgain => ValueConnectableStream(
      _passwordAgainController.stream.map((passwordAgain) => passwordAgain == ''
          ? null
          : _passwordController.value == _passwordAgainController.value
              ? null
              : PasswordNotEqualPasswordAgainError())).autoConnect();

  @override
  void dispose() {
    _emailController.close();
    _usernameController.close();
    _passwordController.close();
    _passwordAgainController.close();
    super.dispose();
  }
}
