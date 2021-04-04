import 'dart:io';

import 'package:dart_counter/model/carrer_stats.dart';
import 'package:dart_counter/model/friend.dart';
import 'package:dart_counter/model/friend_request.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/invitation.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:dart_counter/services/database/impl/firestore_service.dart';
import 'package:dart_counter/services/database/impl/storage_service.dart';
import 'package:rxdart/rxdart.dart';

abstract class DatabaseService {
  static DatabaseService _instance = DatabaseServiceImpl._();

  /// SINGLETON INSTANCE
  static DatabaseService get instance {
    if (_instance == null) {
      _instance = DatabaseServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE
  ValueStream<Profile> get profile;

  ValueStream<List<Invitation>> get invitations;

  ValueStream<List<Friend>> get friends;

  ValueStream<List<FriendRequest>> get friendRequests;

  ValueStream<List<Game>> get gameHistory;

  void createUser(String uid, String username);

  void updatePhoto(String uid, File rawData);

  void removePhoto(String uid);
}

class DatabaseServiceImpl implements DatabaseService {
  final FireStoreService _fireStoreService;
  final StorageService _storageService;

  String _uid = 'dodod';

  DatabaseServiceImpl._()
      : this._fireStoreService = FireStoreService.instance,
        this._storageService = StorageService.instance;

  @override
  ValueStream<Profile> get profile => _fireStoreService.profile(_uid);

  @override
  ValueStream<List<Invitation>> get invitations =>
      _fireStoreService.invitations(_uid);

  @override
  ValueStream<List<Friend>> get friends => _fireStoreService.friends(_uid);

  @override
  ValueStream<List<FriendRequest>> get friendRequests =>
      _fireStoreService.friendRequests(_uid);

  @override
  ValueStream<List<Game>> get gameHistory =>
      _fireStoreService.gameHistory(_uid);

  @override
  void createUser(String uid, String username) {
    _fireStoreService.saveProfile(uid, Profile(null, username, CareerStats()));
  }

  @override
  void updatePhoto(String uid, File rawData) async {
    _fireStoreService.updatePhotoUrl(
        uid, await _storageService.savePhoto(uid, rawData));
  }

  @override
  void removePhoto(String uid) async {
    await _storageService.deletePhoto(uid);
    _fireStoreService.updatePhotoUrl(uid, null);
  }
}
