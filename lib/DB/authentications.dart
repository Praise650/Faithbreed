import 'package:firebase_auth/firebase_auth.dart';

enum AuthenticationState { UserCreated, SignedIn, SignedOut, WrongPassword }

class AuthenticationService {
  // 1
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  // 2
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // 3
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return AuthenticationState.SignedIn.toString();
    } on FirebaseAuthException catch (e) {
      if (e.message.toString() ==
          "The password is invalid or the user does not have a password.")
        return AuthenticationState.WrongPassword.toString();
      return e.message.toString();
    }
  }

  // 4
  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return AuthenticationState.UserCreated.toString();
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  // 5
  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return AuthenticationState.SignedOut.toString();
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

// 6
  User? getUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
  }
}
