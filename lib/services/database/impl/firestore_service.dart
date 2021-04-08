import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/model/friend.dart';
import 'package:dart_counter/model/friend_request.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/invitation.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:rxdart/rxdart.dart';

abstract class FireStoreService {
  static FireStoreService _instance = FireStoreServiceImpl._();

  /// SINGLETON INSTANCE
  static FireStoreService get instance {
    if (_instance == null) {
      _instance = FireStoreServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE

  ValueStream<List<Invitation>> get invitations;

  ValueStream<List<FriendRequest>> get friendRequests;

  Future<Profile> fetchProfile(String uid);

  Future<List<Friend>> fetchFriends(String uid);

  Future<List<Game>> fetchGameHistory(String uid);

  void saveProfile(String uid, Profile profile);

  void updateIsOnline(String uid, bool isOnline);

  void initFriends(String uid);

  void initInvitations(String uid);

  void initFriendRequests(String uid);

  void initGameHistory(String uid);

  void updatePhotoUrl(String uid, String photoUrl);
}

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore _firestore;

  FireStoreServiceImpl._() : this._firestore = FirebaseFirestore.instance;

  // TODO get uid in here for friend request and invites
  @override
  ValueStream<List<Invitation>> get invitations {
    return ValueConnectableStream(_firestore
        .collection('invitations')
        .doc('todo') // TODO
        .snapshots()
        .map((snapshot) => List<Invitation>.from(snapshot
            .data()
            .values
            .map((json) => Invitation.fromJson(json))))).autoConnect();
  }

  @override
  ValueStream<List<FriendRequest>> get friendRequests {
    return ValueConnectableStream(_firestore
        .collection('friendRequests')
        .doc('todo') // TODO
        .snapshots()
        .map((snapshot) => List<FriendRequest>.from(snapshot
            .data()
            .values
            .map((json) => FriendRequest.fromJson(json))))).autoConnect();
  }

  @override
  Future<Profile> fetchProfile(String uid) async {
    return _firestore.collection('profiles')
        .doc(uid)
        .get().then((snapshot) => Profile.fromJson(snapshot.data()));
  }

  @override
  Future<List<Friend>> fetchFriends(String uid) async {
    return _firestore.collection('friendRequests')
        .doc(uid)
        .get().then((snapshot) => List<Friend>.from(snapshot.data().values.map((json) => Friend.fromJson(json))));
  }

  @override
  Future<List<Game>> fetchGameHistory(String uid) async {
    return _firestore.collection('gameHistory')
        .doc(uid)
        .get().then((snapshot) => snapshot.data()['data'].length == 0 ? [] : List<Game>.from(snapshot.data().values.map((json) => Game.fromJson(json))));
  }

  @override
  void saveProfile(String uid, Profile profile) {
    _firestore.collection('profiles').doc(uid).set(profile.toJson());
  }

  @override
  void updateIsOnline(String uid, bool isOnline) {
    _firestore.collection('isOnline').doc(uid).set({'data' : true});
  }

  @override
  void initFriends(String uid) {
    _firestore.collection('friends').doc(uid).set({'data' : []});
  }

  @override
  void initInvitations(String uid) {
    _firestore.collection('invitations').doc(uid).set({'data' : []});
  }

  @override
  void initFriendRequests(String uid) {
    _firestore.collection('friendRequests').doc(uid).set({'data' : []});
  }

  @override
  void initGameHistory(String uid) {
    _firestore.collection('gameHistory').doc(uid).set({'data' : []});
  }

  @override
  void updatePhotoUrl(String uid, String photoUrl) {
    _firestore.collection('profiles').doc(uid).update(
      {'photoUrl': photoUrl},
    );
  }

  /*Future<Profile> fetchProfile(String uid) async {
    var documentSnapshot =
       await _firestore.collection('profiles').doc(uid).get();
    if (documentSnapshot.exists) {
      return Profile.fromJson(documentSnapshot.data());
    }
    return null;
  }

  Future<List<Game>> fetchGameHistory(String uid) async {
    var documentSnapshot = await _firestore.collection('gameHistory').doc(uid).get();
    if (documentSnapshot.exists) {
      return (documentSnapshot.data()['data'] as List)
          .map((e) => Game.fromJson(e))
          .cast<Game>()
          .toList();
    }
    return [];
  }*/
}
