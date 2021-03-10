import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_counter/model/carrer_stats.dart';
import 'package:dart_counter/model/friend.dart';
import 'package:dart_counter/model/friend_request.dart';
import 'package:dart_counter/model/game.dart';
import 'package:dart_counter/model/invitation.dart';
import 'package:dart_counter/model/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;

  DatabaseService() : this._firestore = FirebaseFirestore.instance, this._firebaseStorage = FirebaseStorage.instance;

  /// IN
  Stream<Profile> profile(String uid) {
    return _firestore.collection('profiles').doc(uid).snapshots().map((snapshot) => Profile.fromJson(snapshot.data()));
  }

  Stream<List<Invitation>> invitations(String uid) {
    return _firestore.collection('invitations').doc(uid).snapshots().map((snapshot) {

      List<Invitation> invitations = List<Invitation>.from(snapshot.data().values.map((model)=> Invitation.fromJson(model)));
      print(invitations);
      return invitations;
    });
  }

  Stream<List<Friend>> friends(String uid) {
    return _firestore.collection('friends').doc(uid).snapshots().map((snapshot) {
      print(snapshot.data());
      return List();
    });
  }

  Stream<List<FriendRequest>> friendRequests(String uid) {
    return _firestore.collection('friendRequests').doc(uid).snapshots().map((snapshot) {
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

  /// OUT

  void createUser(String uid, String username) {
    Profile profile = Profile(null, username, CarrerStats());
    _firestore.collection('profiles').doc(uid).set(profile.toJson());
  }

  void updatePhotoUrl(String uid, File data) async {
    var ref = _firebaseStorage.ref('profilePhotos/$uid');
    await ref.putFile(data);
    String photoUrl = await ref.getDownloadURL();
    _firestore.collection('profiles').doc(uid).update({'photoUrl' : photoUrl}, );
  }




  void insertDummyData(String uid) async {
    Profile profile = Profile.dummy();
    List<Invitation> invitations = [Invitation.dummy(), Invitation.dummy(), Invitation.dummy()];
    List<Friend> friends = [Friend.dummy(), Friend.dummy(), Friend.dummy()];
    List<FriendRequest> friendRequests = [FriendRequest.dummy(), FriendRequest.dummy(), FriendRequest.dummy()];
    List<Game> games = [Game.dummy(), Game.dummy(), Game.dummy()];

    _firestore.collection('profiles').doc(uid).set(profile.toJson());
    _firestore.collection('invitations').doc(uid).set({'data': invitations.map((e) => e.toJson()).toList()});
    _firestore.collection('friends').doc(uid).set({'data': friends.map((e) => e.toJson()).toList()});
    _firestore.collection('friendRequests').doc(uid).set({'data': friendRequests.map((e) => e.toJson()).toList()});
    _firestore.collection('gameHistory').doc(uid).set({'data': games.map((e) => e.toJson()).toList()});
    _firestore.collection('isOnline').doc(uid).set({'data': true});
  }
}
