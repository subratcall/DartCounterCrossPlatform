import 'package:dart_counter/app_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

abstract class FirebaseAuthService {
  static FirebaseAuthService _instance;

  /// SINGLETON INSTANCE
  static FirebaseAuthService get instance {
    if (_instance == null) {
      _instance = FirebaseAuthServiceImpl._();
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

  Future<void> signOut();
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthServiceImpl._() : _firebaseAuth = FirebaseAuth.instance;

  @override
  ValueStream<User> get currentUser =>
      ValueConnectableStream(_firebaseAuth.authStateChanges()).autoConnect();

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        throw InvalidEmailAddressOrPasswordError();
      }
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        throw InvalidEmailAddressError();
      }
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        throw EmailAddressAlreadyInUseError();
      }
    }
  }

  @override
  Future<void> signInGoogle() {
    // TODO implement
    throw UnimplementedError();
  }

  @override
  Future<void> signInFacebook() {
    // TODO implement
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
