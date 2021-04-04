import 'dart:async';

import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/services/authentication/authentication_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class ResetPasswordViewModel extends ViewModel {
  /// INPUT
  Sink<String> get inputEmail;

  Future<void> onConfirmPressed();

  /// OUTPUT
  Stream<Error> get outputErrorEmail;
}

class ResetPasswordViewModelImpl extends ResetPasswordViewModel {
  final AuthenticationService _authenticationService =
      AuthenticationService.instance;

  BehaviorSubject<String> _emailController = BehaviorSubject();

  /// INPUT
  @override
  Sink<String> get inputEmail => _emailController;

  @override
  Future<void> onConfirmPressed() async {
    if (!_emailController.hasValue ||
        !EmailValidator.validate(_emailController.value)) {
      throw InvalidEmailAddressError();
    }

    try {
      inputViewState.add(ViewState.loading);
      _authenticationService.resetPassword(_emailController.value);
      inputViewState.add(ViewState.success);
    } on Error catch (e) {
      inputViewState.add(ViewState.idle);
      throw e;
    }
  }

  /// OUTPUT
  @override
  ValueStream<Error> get outputErrorEmail =>
      ValueConnectableStream(_emailController.stream.map((email) =>
              email == '' ? null : EmailValidator.validateError(email)))
          .autoConnect();

  @override
  void dispose() {
    _emailController.close();
  }
}
