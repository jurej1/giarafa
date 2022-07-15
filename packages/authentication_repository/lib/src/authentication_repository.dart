import 'package:firebase_auth/firebase_auth.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

extension AuthenticationStatusX on AuthenticationStatus {
  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
}

class AuthenticationRepository {
  const AuthenticationRepository({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  Stream<User?> getUser() {
    return _firebaseAuth.authStateChanges();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
