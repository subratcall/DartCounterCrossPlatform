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
  ValueStream<Profile> profile(String uid);

  ValueStream<List<Invitation>> invitations(String uid);

  ValueStream<List<Friend>> friends(String uid);

  ValueStream<List<FriendRequest>> friendRequests(String uid);

  ValueStream<List<Game>> gameHistory(String uid);

  void saveProfile(String uid, Profile profile);

  void updatePhotoUrl(String uid, String photoUrl);

}

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore _firestore;

  FireStoreServiceImpl._() : this._firestore = FirebaseFirestore.instance;

  @override
  ValueStream<Profile> profile(String uid) {
    return ValueConnectableStream(_firestore
        .collection('profiles')
        .doc(uid)
        .snapshots()
        .map((snapshot) => Profile.fromJson(snapshot.data())));
  }

  @override
  ValueStream<List<Invitation>> invitations(String uid) {
    return ValueConnectableStream(_firestore
        .collection('invitations')
        .doc(uid)
        .snapshots()
        .map((snapshot) => List<Invitation>.from(snapshot.data().values.map((json) => Invitation.fromJson(json)))));
  }

  @override
  ValueStream<List<Friend>> friends(String uid) {
    return ValueConnectableStream(_firestore
        .collection('friends')
        .doc(uid)
        .snapshots()
        .map((snapshot) => List<Friend>.from(snapshot.data().values.map((json) => Friend.fromJson(json)))));
  }

  @override
  ValueStream<List<FriendRequest>> friendRequests(String uid) {
    return ValueConnectableStream(_firestore
        .collection('friendRequests')
        .doc(uid)
        .snapshots()
        .map((snapshot) => List<FriendRequest>.from(snapshot.data().values.map((json) => FriendRequest.fromJson(json)))));
  }

  @override
  ValueStream<List<Game>> gameHistory(String uid) {
    return ValueConnectableStream(_firestore
        .collection('gameHistory')
        .doc(uid)
        .snapshots()
        .map((snapshot) => List<Game>.from(snapshot.data().values.map((json) => Game.fromJson(json)))));
  }


  @override
  void saveProfile(String uid, Profile profile) {
    _firestore.collection('profiles').doc(uid).set(profile.toJson());
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
