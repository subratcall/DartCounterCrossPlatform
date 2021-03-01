import 'package:dart_counter/app_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService() : this._firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanged => _firebaseAuth.authStateChanges();

  Future<void> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch(e) {
      // TODO use code to map to app_errors
      print("${e.message} ${e.code}");
      throw InvalidEmailAddressOrPasswordError();
    }
  }

  Future<void> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException {
      throw EmailAddressAlreadyInUseError();
    }
  }

  Future<dynamic> signInFacebook() {
    // TODO implement
  }

  Future<dynamic> signInGoogle() {
    // TODO implement
  }

  Future<dynamic> signInInstagram() {
    // TODO implement
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
