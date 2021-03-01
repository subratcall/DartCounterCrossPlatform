import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/helper/validator.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

enum SignInViewState { initial, loading, successful, error }

class SignInViewModel extends ViewModel<SignInViewState> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  SignInViewModel() {
    viewState = SignInViewState.initial;
  }

  Future<void> onSignPressed({String email, String password}) async {
    if (EmailValidator.validate(email.trim())) {
      throw InvalidEmailAddressError();
    }

    if (PasswordValidator.validate(password.trim())) {
      throw InvalidPasswordError();
    }

    //_authenticationService.signIn(email: email, password: password);
    await Future.delayed(const Duration(seconds: 2), () {});
    // TODO throw InvalidEmail or ConnectionError using the response from firebase
  }

  void onSignInFacebookPressed() {
    _authenticationService.signInFacebook();
  }

  void onSignInGooglePressed() {
    _authenticationService.signInGoogle();
  }

  void onSignInInstagramPressed() {
    _authenticationService.signIn();
  }
}
