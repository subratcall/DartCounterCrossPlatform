import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class HomeViewModel extends ViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  int newInvites;
  int newFriendRequests;

  void signOut() {
    _authenticationService.signOut();
  }
}
