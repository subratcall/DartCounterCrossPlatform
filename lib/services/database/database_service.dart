import 'dart:io';

import 'package:dart_counter/model/career_stats.dart';
import 'package:dart_counter/model/friend.dart';
import 'package:dart_counter/model/friend_request.dart';
import 'package:dart_counter/model/game/offline_game.dart';
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
  String uid;

  ValueStream<Profile> get profiles;

  ValueStream<List<Invitation>> get invitations;

  ValueStream<List<Friend>> get friends;

  ValueStream<List<FriendRequest>> get friendRequests;

  ValueStream<List<OfflineGame>> get gameHistory;

  void fetchProfile();

  void fetchFriends();

  void fetchGameHistory();

  void createUser(String username);

  void updatePhoto(File rawData);

  void removePhoto();
}

class DatabaseServiceImpl implements DatabaseService {
  final FireStoreService _fireStoreService;
  final StorageService _storageService;

  final BehaviorSubject<Profile> _profilesController = BehaviorSubject();
  final BehaviorSubject<List<Friend>> _friendsController = BehaviorSubject();
  final BehaviorSubject<List<OfflineGame>> _gameHistoryController = BehaviorSubject();

  DatabaseServiceImpl._()
      : this._fireStoreService = FireStoreService.instance,
        this._storageService = StorageService.instance;

  @override
  String uid;

  @override
  ValueStream<Profile> get profiles => _profilesController.stream;

  @override
  ValueStream<List<Invitation>> get invitations => _fireStoreService.invitations;

  @override
  ValueStream<List<Friend>> get friends => _friendsController.stream;

  @override
  ValueStream<List<FriendRequest>> get friendRequests => _fireStoreService.friendRequests;

  @override
  ValueStream<List<OfflineGame>> get gameHistory => _gameHistoryController.stream;

  @override
  void fetchProfile() async {
    Profile profile = await _fireStoreService.fetchProfile(uid);
    _profilesController.add(profile);
  }

  @override
  void fetchFriends() async {
    List<Friend> friends = await _fireStoreService.fetchFriends(uid);
    _friendsController.add(friends);
  }

  @override
  void fetchGameHistory() async {
    List<OfflineGame> gameHistory = await _fireStoreService.fetchGameHistory(uid);
    _gameHistoryController.add(gameHistory);
  }

  @override
  void createUser(String username) {
    _fireStoreService.saveProfile(uid, Profile(null, username, CareerStats()));
    _fireStoreService.updateIsOnline(uid, true);
    _fireStoreService.initFriendRequests(uid);
    _fireStoreService.initFriends(uid);
    _fireStoreService.initInvitations(uid);
    _fireStoreService.initGameHistory(uid);
  }

  @override
  void updatePhoto(File rawData) async {
    _fireStoreService.updatePhotoUrl(uid, await _storageService.savePhoto(uid, rawData));
  }

  @override
  void removePhoto() async {
    await _storageService.deletePhoto(uid);
    _fireStoreService.updatePhotoUrl(uid, null);
  }

  void dispose() {
    _profilesController.close();
    _friendsController.close();
    _gameHistoryController.close();
  }
}
