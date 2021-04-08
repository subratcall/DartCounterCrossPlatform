import 'package:rxdart/rxdart.dart';

import '../database/database_service.dart';
import 'impl/firebase_auth_service.dart';
import 'impl/instagram_auth_service.dart';

abstract class AuthenticationService {
  static AuthenticationService _instance = AuthenticationServiceImpl._();

  /// SINGLETON INSTANCE
  static AuthenticationService get instance {
    if (_instance == null) {
      _instance = AuthenticationServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE
  ValueStream<String> get currentUid;

  Future<void> signIn(String email, String password);

  Future<void> resetPassword(String email);

  Future<void> signUp(String email, String password);

  Future<void> signInGoogle();

  Future<void> signInFacebook();

  Future<void> signInInstagram();

  Future<void> signOut();
}

class AuthenticationServiceImpl implements AuthenticationService {
  final FirebaseAuthService _firebaseAuth = FirebaseAuthService.instance;
  final InstagramAuthService _instagramAuth = InstagramAuthService.instance;

  AuthenticationServiceImpl._();

  ValueStream<String> get currentUid => ValueConnectableStream(_firebaseAuth.currentUser
      .map((firebaseUser) {
        // TODO remove this reference to db service for more modularity
        DatabaseService.instance.uid = firebaseUser.uid;
    return firebaseUser != null ? firebaseUser.uid : null;
  })).autoConnect();

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signIn(email, password);
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.resetPassword(email);
  }

  Future<void> signUp(String email, String password) async {
    await _firebaseAuth.signUp(email, password);
  }

  Future<void> signInGoogle() async {
    await _firebaseAuth.signInGoogle();
  }

  Future<void> signInFacebook() async {
    await _firebaseAuth.signInFacebook();
  }

  Future<void> signInInstagram() async {
    await _instagramAuth.signIn();
  }

  Future<void> signOut() async {
    // todo firebase auth
    if (true) {
      await _firebaseAuth.signOut();
    } else {
      // todo ig
      throw UnimplementedError();
    }
  }
}
