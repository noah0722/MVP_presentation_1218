import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/data/repositories/base_repository.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/constants/app_constants.dart';

class AuthRepository extends BaseRepository {
  AuthRepository(FirebaseService firebaseService) : super(firebaseService);

  @override
  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.collection(AppConstants.usersCollection);

  Future<UserCredential?> signInWithGoogle() async {
    return await firebaseService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await firebaseService.signOut();
  }

  Future<bool> isAdmin(String uid) async {
    try {
      final doc = await collection.doc(uid).get();
      return doc.data()?['isAdmin'] == true;
    } catch (e) {
      return false;
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> userStream(String uid) {
    return collection.doc(uid).snapshots();
  }

  Future<void> updateUsername(String uid, String username) async {
    await collection.doc(uid).update({'displayName': username});
  }
}