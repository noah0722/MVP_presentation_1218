import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_service.dart';

class AuthService {
  final FirebaseService _firebaseService;

  AuthService(this._firebaseService);

  User? get currentUser => _firebaseService.auth.currentUser;

  Stream<User?> authStateChanges() => _firebaseService.auth.authStateChanges();

  Future<UserCredential?> signInWithGoogle() async {
    return await _firebaseService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _firebaseService.signOut();
  }

  Future<bool> isAdmin() async {
    return await _firebaseService.isAdmin(currentUser?.uid ?? '');
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.watch(firebaseServiceProvider));
});
