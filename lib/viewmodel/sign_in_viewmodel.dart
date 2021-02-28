import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class SignInViewModel extends ViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<bool> signIn() async {

  }

}