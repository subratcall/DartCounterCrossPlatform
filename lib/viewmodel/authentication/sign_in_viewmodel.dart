import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

enum SignInViewState { idle, loading }

class SignInViewModel extends ViewModel<SignInViewState> {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  SignInViewModel() {
    viewState = SignInViewState.idle;
  }

  Future<void> onSignInPressed({String email, String password}) async {
    if (!EmailValidator.validate(email) || !PasswordValidator.validate(password)) {
      throw InvalidEmailAddressOrPasswordError();
    }

    viewState = SignInViewState.loading;
    try {
      await _authenticationService.signIn(email: email, password: password);
    } on Error catch (e) {
      viewState = SignInViewState.idle;
      throw e;
    }
  }
}
