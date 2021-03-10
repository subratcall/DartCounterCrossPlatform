import 'package:dart_counter/api/database_service.dart';
import 'package:dart_counter/app_errors.dart';
import 'package:dart_counter/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService() : this._firebaseAuth = FirebaseAuth.instance;


  Stream<User> get authStateChanged => _firebaseAuth.authStateChanges();

  Future<void> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      print("${e.message} ${e.code}");
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        throw InvalidEmailAddressOrPasswordError();
      }
    }
  }

  Future<void> resetPassword({String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print("${e.message} ${e.code}");
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        // TODO map errors
        throw InvalidEmailAddressError();
      }
    }
  }

  Future<void> signUp({String email, String password, onSuccess(String uid)}) async {
    try {
      // Try to create user
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      onSuccess(_firebaseAuth.currentUser.uid);
    } on FirebaseAuthException catch (e) {
      print("${e.message} ${e.code}");
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        throw EmailAddressAlreadyInUseError();
      }
    }
  }

  Future<void> signInFacebook() {
    // TODO implement
  }

  Future<void> signInGoogle() {
    // TODO implement
  }

  Future<void> signInInstagram() {
    // TODO implement
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
