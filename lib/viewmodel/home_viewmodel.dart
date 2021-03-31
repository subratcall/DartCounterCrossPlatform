import 'dart:async';

import 'package:dart_counter/app_model.dart';
import 'package:dart_counter/locator.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/authentication_service.dart';
import 'package:dart_counter/services/database_service.dart';
import 'package:dart_counter/viewmodel/viewmodel.dart';

abstract class HomeViewModel extends ViewModel {

  /// IN

  /// OUT

  Stream<Profile> get outputProfile;

  Stream<int> get outputNewInvites;

  Stream<int> get outputNewFriendRequests;

  /// METHODS
  void onSignOutPressed();

}

class HomeViewModelImpl implements HomeViewModel {
  final AppModel _appModel = locator<AppModel>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  /// IN

  /// OUT

  @override
  Stream<ViewState> get outputViewState => throw UnimplementedError();

  @override
  Stream<Profile> get outputProfile => _databaseService.profile(_appModel.uid);

  @override
  Stream<int> get outputNewInvites => Stream<int>.periodic(Duration(seconds: 10), (index) => index);

  @override
  Stream<int> get outputNewFriendRequests => Stream<int>.periodic(Duration(seconds: 10), (index) => index);

  /// METHODS
  @override
  void onSignOutPressed() {
    _authenticationService.signOut();
  }

  @override
  void dispose() {

  }

}
