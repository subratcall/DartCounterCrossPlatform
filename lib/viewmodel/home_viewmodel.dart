import 'dart:async';

import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/authentication/authentication_service.dart';
import 'package:dart_counter/services/database/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class HomeViewModel extends ViewModel {
  /// IN

  /// OUT

  ValueStream<Profile> get outputProfile;

  ValueStream<int> get outputNewInvites;

  ValueStream<int> get outputNewFriendRequests;

  /// METHODS

  void fetchProfile();

  void onSignOutPressed();
}

class HomeViewModelImpl extends HomeViewModel {
  final AuthenticationService _authenticationService = AuthenticationService.instance;
  final DatabaseService _databaseService = DatabaseService.instance;

  /// IN

  /// OUT

  @override
  ValueStream<Profile> get outputProfile => _databaseService.profiles;

  // TODO get real data
  @override
  ValueStream<int> get outputNewInvites => ValueConnectableStream(Stream<int>.periodic(Duration(seconds: 10), (index) => index)).autoConnect();

  // TODO get real data
  @override
  ValueStream<int> get outputNewFriendRequests => ValueConnectableStream(Stream<int>.periodic(Duration(seconds: 10), (index) => index)).autoConnect();

  /// METHODS
  @override
  void fetchProfile() async {
    _databaseService.fetchProfile();
  }

  @override
  void onSignOutPressed() {
    _authenticationService.signOut();
  }

}
