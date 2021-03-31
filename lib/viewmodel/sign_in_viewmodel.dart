import 'dart:async';

import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class SignInViewModel extends ViewModel {

  Future<void> onSignInPressed({String email, String password});
}


class SignInViewModelImpl implements SignInViewModel {

  final StreamController<ViewState> _viewStateController = StreamController.broadcast();

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();

  SignInViewModel() {
    _viewStateController.add(ViewState.idle);
  }

  Future<void> onSignInPressed({String email, String password}) async {
    if (!EmailValidator.validate(email) ||
        !PasswordValidator.validate(password)) {
      throw InvalidEmailAddressOrPasswordError();
    }

    _viewStateController.add(ViewState.loading);
    try {
      await _authenticationService.signIn(email: email, password: password);
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
