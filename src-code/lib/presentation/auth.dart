import 'package:ahapp3/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName, // Add display name parameter
  }) async {
    print("IN CREATE USER AWAIT");
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (_firebaseAuth.currentUser != null) {
      print("IN CREATE NULL CHECK");
      await _firebaseAuth.currentUser!.updateDisplayName(displayName); // Set user's display name
      await DatabaseService(uid: _firebaseAuth.currentUser!.uid).initializeUser();
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
