import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Provider for FirebaseService
final firebaseServiceProvider = Provider((ref) => FirebaseService());

/// Main service class for handling Firebase operations
class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Auth getters
  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firestore => _firestore;
  FirebaseStorage get storage => _storage;
  User? get currentUser => _auth.currentUser;

  /// Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      // Create or update user document in Firestore
      if (userCredential.user != null) {
        await _createOrUpdateUserDocument(userCredential.user!);
      }

      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  /// Create or update user document in Firestore
  Future<void> _createOrUpdateUserDocument(User user) async {
    final userDoc = _firestore.collection('users').doc(user.uid);

    final userData = {
      'email': user.email,
      'displayName': user.displayName ?? 'Anonymous User',
      'photoURL': user.photoURL,
      'lastSignIn': FieldValue.serverTimestamp(),
      'commorePoints': FieldValue.increment(0), // Initialize points if new user
    };

    await userDoc.set(userData, SetOptions(merge: true));
  }

  /// Upload file to Firebase Storage
  Future<String> uploadFile(String path, Uint8List fileBytes) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.putData(fileBytes);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error uploading file: $e');
      rethrow;
    }
  }

  /// Delete file from Firebase Storage
  Future<void> deleteFile(String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.delete();
    } catch (e) {
      print('Error deleting file: $e');
      rethrow;
    }
  }

  /// Check if user is admin
  Future<bool> isUserAdmin(String uid) async {
    try {
      final userDoc = await _firestore.collection('users').doc(uid).get();
      return userDoc.data()?['isAdmin'] == true;
    } catch (e) {
      print('Error checking admin status: $e');
      return false;
    }
  }

  /// Award commore points to user
  Future<void> awardCommorePoints(String uid, int points) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'commorePoints': FieldValue.increment(points),
      });

      // Add transaction record
      await _firestore.collection('commoreTransactions').add({
        'userId': uid,
        'points': points,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'award',
      });
    } catch (e) {
      print('Error awarding commore points: $e');
      rethrow;
    }
  }

  /// Get user's commore points
  Future<int> getUserCommorePoints(String uid) async {
    try {
      final userDoc = await _firestore.collection('users').doc(uid).get();
      return userDoc.data()?['commorePoints'] ?? 0;
    } catch (e) {
      print('Error getting commore points: $e');
      return 0;
    }
  }

  isAdmin(String s) {}
}
