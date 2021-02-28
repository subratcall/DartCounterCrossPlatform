import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class SignInViewModel extends ViewModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  void onSignPressed({String email, String password}) {
    _authenticationService.signIn(email: email, password: password);
  }

  void onSignInFacebookPressed() {
    // TODO implement
  }

  void onSignInGooglePressed() {
    // TODO implement
  }

  void onSignInInstagramPressed() {
    // TODO implement
  }

}
