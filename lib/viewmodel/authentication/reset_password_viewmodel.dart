import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

enum ResetPasswordViewState { idle, loading, successful }

class ResetPasswordViewModel extends ViewModel<ResetPasswordViewState> {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  ResetPasswordViewModel() {
    viewState = ResetPasswordViewState.idle;
  }

  void onConfirmPressed({String email}) async {
    viewState = ResetPasswordViewState.loading;
    try {
      await _authenticationService.resetPassword(email: email);
      viewState = ResetPasswordViewState.successful;
    } on Error catch(e) {
      viewState = ResetPasswordViewState.idle;
      throw e;
    }

  }
}
