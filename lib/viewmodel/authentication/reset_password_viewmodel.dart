import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

enum ResetPasswordViewState { idle, loading, successful }

class ResetPasswordViewModel extends ViewModel<ResetPasswordViewState> {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  ResetPasswordViewModel() {
    viewState = ResetPasswordViewState.idle;
  }

  Future<void> onConfirmPressed({String email}) async {
    if (!EmailValidator.validate(email)) {
      throw InvalidEmailAddressError();
    }

    viewState = ResetPasswordViewState.loading;
    try {
      await _authenticationService.resetPassword(email: email);
      viewState = ResetPasswordViewState.successful;
    } on Error catch (e) {
      viewState = ResetPasswordViewState.idle;
      throw e;
    }
  }
}
