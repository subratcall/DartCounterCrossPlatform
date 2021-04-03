import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/model/carrer_stats.dart';
import 'package:dart_counter/model/friend.dart';
import 'package:dart_counter/model/friend_request.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/invitation.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart';
import 'package:rxdart/rxdart.dart';

abstract class DatabaseService {

  static DatabaseService _instance = DatabaseServiceImpl._();

  /// SINGLETON INSTANCE
  static DatabaseService get instance {
    if(_instance == null) {
      _instance = DatabaseServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE

}

class DatabaseServiceImpl implements DatabaseService {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  final  BehaviorSubject<Profile> _profileController = BehaviorSubject();

  DatabaseServiceImpl._()
      : this._firestore = FirebaseFirestore.instance,
        this._firebaseStorage = FirebaseStorage.instance;

  /// IN
  ValueStream<Profile> profile(String uid) {
    return ValueConnectableStream(
        _firestore
            .collection('profiles')
            .doc(uid)
            .snapshots()
            .map((snapshot) => Profile.fromJson(snapshot.data()))
    );
  }

  Stream<List<Invitation>> invitations(String uid) {
    return _firestore
        .collection('invitations')
        .doc(uid)
        .snapshots()
        .map((snapshot) {
      List<Invitation> invitations = List<Invitation>.from(
          snapshot.data().values.map((model) => Invitation.fromJson(model)));
      print(invitations);
      return invitations;
    });
  }

  Stream<List<Friend>> friends(String uid) {
    return _firestore
        .collection('friends')
        .doc(uid)
        .snapshots()
        .map((snapshot) {
      print(snapshot.data());
      return List();
    });
  }

  Stream<List<FriendRequest>> friendRequests(String uid) {
    return _firestore
        .collection('friendRequests')
        .doc(uid)
        .snapshots()
        .map((snapshot) {
      print(snapshot.data());
      return List();
    });
  }

  Stream<List<Game>> gameHistory(String uid) {
    return _firestore.collection('gameHistory').doc(uid).snapshots().map((snapshot) {
      print(snapshot.data());
      return List();
    });
  }

  Future<Profile> fetchProfile(String uid) async {
    var documentSnapshot =
    await _firestore.collection('profiles').doc(uid).get();
    if (documentSnapshot.exists) {
      return Profile.fromJson(documentSnapshot.data());
    }
    return null;
  }

  Future<List<Game>> fetchGameHistory(String uid) async {
    var documentSnapshot =
    await _firestore.collection('gameHistory').doc(uid).get();
    if (documentSnapshot.exists) {
      return (documentSnapshot.data()['data'] as List)
          .map((e) => Game.fromJson(e))
          .cast<Game>()
          .toList();
    }
    return [];
  }

  /// OUT

  void createUser(String uid, String username) {
    Profile profile = Profile(null, username, CareerStats());
    _firestore.collection('profiles').doc(uid).set(profile.toJson());
  }

  void updatePhoto(String uid, File rawData) async {
    var ref = _firebaseStorage.ref('profilePhotos/$uid');
    var thumbnail =
    copyResize(decodeImage(rawData.readAsBytesSync()), width: 120);
    await ref.putData(
        encodePng(thumbnail), SettableMetadata(contentType: 'image/png'));
    String photoUrl = await ref.getDownloadURL();
    _firestore.collection('profiles').doc(uid).update(
      {'photoUrl': photoUrl},
    );
  }

  void removePhoto(String uid) async {
    var ref = _firebaseStorage.ref('profilePhotos/$uid');
    await ref.delete();
    _firestore.collection('profiles').doc(uid).update(
      {'photoUrl': null},
    );
  }

  void dispose() {
    _profileController.close();
  }
}
