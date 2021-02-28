import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class SignUpViewModel extends ViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  void onConfirmPressed({String email, String username, String password, String passwordAgain}) {
    // TODO validate inputs
    _authenticationService.signUp(email: email, password: password);
  }

}
