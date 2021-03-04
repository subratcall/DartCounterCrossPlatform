import 'package:dart_counter/api/authentication.dart';
import 'package:dart_counter/api/database.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class HomeViewModel extends ViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  int newInvites;
  int newFriendRequests;

  Stream<Profile> profile() {
    return _databaseService.profile('JOAVDAkIiyfOswHtNjquCbe7fyh2');
  }

  void signOut() {
    _authenticationService.signOut();
  }
}
