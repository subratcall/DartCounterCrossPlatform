import 'dart:async';

import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

class HomeViewModel extends ViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  int newInvites;
  int newFriendRequests;

  Stream<Profile> profile() => _databaseService.profile(appModel.uid);

  void onSignOutPressed() {
    _authenticationService.signOut();
  }

  String _text = 'Initial';

  String get text =>  _text;
  set text(String text) {
    _text = text;
    notifyListeners();
  }

}


abstract class HomeViewModel2 {

  /// IN
  Sink<String> get inputText;

  /// OUT
  Stream<String> get outputText;


  void dispose();

}

class HomeViewModel2Impl implements HomeViewModel2 {

  StreamController<String> _textController = StreamController<String>.broadcast();

  /// IN
  @override
  Sink<String> get inputText => _textController;

  /// OUT
  Stream<String> get outputText => _textController.stream;


  @override
  void dispose() {
    _textController.close();
  }
}
