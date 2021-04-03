import 'dart:async';

import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/authentication/authentication_service.dart';
import 'package:dart_counter/services/database/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';
import 'package:rxdart/rxdart.dart';

abstract class HomeViewModel extends ViewModel {
  /// IN

  /// OUT

  Stream<Profile> get outputProfile;

  Stream<int> get outputNewInvites;

  Stream<int> get outputNewFriendRequests;

  /// METHODS
  void onSignOutPressed();
}

class HomeViewModelImpl extends HomeViewModel {
  final AuthenticationService _authenticationService = AuthenticationService.instance;
  final DatabaseService _databaseService = DatabaseService.instance;

  BehaviorSubject<Profile> _profileController = BehaviorSubject();

  /// IN

  /// OUT

  @override
  Stream<Profile> get outputProfile => _databaseService.profile(_appModel.uid);

  @override
  Stream<int> get outputNewInvites =>
      Stream<int>.periodic(Duration(seconds: 10), (index) => index);

  @override
  Stream<int> get outputNewFriendRequests =>
      Stream<int>.periodic(Duration(seconds: 10), (index) => index);

  /// METHODS
  @override
  void onSignOutPressed() {
    _authenticationService.signOut();
  }

  @override
  void dispose() {
    _profileController.close();
  }
}
