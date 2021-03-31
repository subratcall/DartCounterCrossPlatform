import 'dart:async';

import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class ResetPasswordViewModel extends ViewModel {

  Future<void> onConfirmPressed({String email});

}

class ResetPasswordViewModelImpl implements ResetPasswordViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  final StreamController<ViewState> _viewStateController = StreamController.broadcast();

  ResetPasswordViewModel() {
    _viewStateController.add(ViewState.idle);
  }

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  Future<void> onConfirmPressed({String email}) async {
    if (!EmailValidator.validate(email)) {
      throw InvalidEmailAddressError();
    }

    _viewStateController.add(ViewState.loading);
    try {
      await _authenticationService.resetPassword(email: email);
      _viewStateController.add(ViewState.success);
    } on Error catch (e) {
      _viewStateController.add(ViewState.idle);
      throw e;
    }
  }

  @override
  void dispose() {
    _viewStateController.close();
  }
}
