import 'package:dart_counter/model/user.dart';

import 'impl/firebase_auth_service.dart';
import 'impl/instagram_auth_service.dart';

abstract class AuthenticationService {

  static AuthenticationService _instance = AuthenticationServiceImpl._();

  /// SINGLETON INSTANCE
  static AuthenticationService get instance {
    if(_instance == null) {
      _instance = AuthenticationServiceImpl._();
    }
    return _instance;
  }

  /// INTERFACE
  Stream<User> get currentUser;

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

  Stream<User> get currentUser => throw UnimplementedError(); // TODO implement

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
    // TODO implement
    throw new UnimplementedError();
  }

}