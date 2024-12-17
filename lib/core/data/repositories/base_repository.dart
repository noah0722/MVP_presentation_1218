import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/firebase_service.dart';

abstract class BaseRepository {
  final FirebaseService firebaseService;
  final FirebaseFirestore firestore;

  BaseRepository(this.firebaseService) : firestore = firebaseService.firestore;

  String? get currentUserId => firebaseService.currentUser?.uid;

  CollectionReference<Map<String, dynamic>> get collection;

  Future<void> update(String id, Map<String, dynamic> data) async {
    await collection.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    await collection.doc(id).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> get(String id) async {
    return await collection.doc(id).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAll() async {
    return await collection.get();
  }
}
