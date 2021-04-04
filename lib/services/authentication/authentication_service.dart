import 'package:dart_counter/model/user.dart';
import 'package:dart_counter/services/database/database_service.dart';
import 'package:rxdart/rxdart.dart';

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
  ValueStream<User> get currentUser;

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
  final DatabaseService _databaseService = DatabaseService.instance;

  AuthenticationServiceImpl._();

  // TODO usertype has to be determined
  ValueStream<User> get currentUser => _firebaseAuth.currentUser
          .map((firebaseUser) => firebaseUser != null
              ? User(firebaseUser.uid, UserType.emailPassword,
                  _databaseService.profile.value)
              : null)
          .mergeWith([
        _databaseService.profile.map((profile) => currentUser != null
            ? User(currentUser.value.uid, UserType.emailPassword, profile)
            : null)
      ]);

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
    if (currentUser.value.userType == UserType.emailPassword) {
      await _firebaseAuth.signOut();
    } else {
      // TODO
      throw UnimplementedError();
    }
  }
}
