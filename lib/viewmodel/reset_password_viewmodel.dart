import 'dart:async';

import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class ResetPasswordViewModel extends ViewModel {

  /// INPUT
  Sink<String> get inputEmail;
  Future<void> onConfirmPressed();

  /// OUTPUT
  Stream<bool> get outputIsConfirmButtonEnabled;

}

class ResetPasswordViewModelImpl extends ResetPasswordViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  BehaviorSubject<String> _emailController = BehaviorSubject();

  ResetPasswordViewModelImpl() {
    inputViewState.add(ViewState.idle);
  }

  /// INPUT
  @override
  Sink<String> get inputEmail => _emailController;

  @override
  Future<void> onConfirmPressed() async {
    if (!_emailController.hasValue || !EmailValidator.validate(_emailController.value)) {
      throw InvalidEmailAddressError();
    }

    try {
      inputViewState.add(ViewState.loading);
      await _authenticationService.resetPassword(email: _emailController.value);
      inputViewState.add(ViewState.success);
    } on Error catch (e) {
      inputViewState.add(ViewState.idle);
      throw e;
    }
  }

  /// OUTPUT
  @override
  Stream<bool> get outputIsConfirmButtonEnabled => _emailController.stream.map((email) => EmailValidator.validate(email));

  @override
  void dispose() {
    _emailController.close();
  }
}
