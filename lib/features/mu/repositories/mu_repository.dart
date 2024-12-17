import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/data/repositories/base_repository.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/constants/app_constants.dart';
import '../models/mu_model.dart';

class MuRepository extends BaseRepository {
  MuRepository(super.firebaseService);

  @override
  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.collection(AppConstants.musCollection);

  Future<DocumentReference> createMu({
    required String name,
    required String description,
    required String profileImageUrl,
    required String bannerImageUrl,
    required String country,
    required String language,
    required String topicLevel1,
    required String topicLevel2,
    String? officialType,
    String? officialBadgeUrl,
  }) async {
    if (!(await firebaseService.isAdmin(currentUserId ?? ''))) {
      throw Exception('Only admin can create mu');
    }

    final mu = {
      'name': name,
      'description': description,
      'profileImageUrl': profileImageUrl,
      'bannerImageUrl': bannerImageUrl,
      'country': country,
      'language': language,
      'topicLevel1': topicLevel1,
      'topicLevel2': topicLevel2,
      'memberCount': 0,
      'postCount': 0,
      'createdAt': FieldValue.serverTimestamp(),
      'isOfficial': officialType != null,
      'officialType': officialType,
      'officialBadgeUrl': officialBadgeUrl,
      'isVerified': false,
    };

    return await collection.add(mu);
  }

  Future<void> joinMu(String muId) async {
    final userId = currentUserId;
    if (userId == null) throw Exception('Not authenticated');

    await firestore
        .collection('userMus')
        .doc(userId)
        .collection('joined')
        .doc(muId)
        .set({
      'joinedAt': FieldValue.serverTimestamp(),
    });

    await collection.doc(muId).update({
      'memberCount': FieldValue.increment(1),
    });

    await firebaseService.awardCommorePoints(
      userId,
      AppConstants.joinMuPoints,
    );
  }

  Future<void> leaveMu(String muId) async {
    final userId = currentUserId;
    if (userId == null) throw Exception('Not authenticated');

    await firestore
        .collection('userMus')
        .doc(userId)
        .collection('joined')
        .doc(muId)
        .delete();

    await collection.doc(muId).update({
      'memberCount': FieldValue.increment(-1),
    });
  }

  Future<void> recordVisit(String muId) async {
    final userId = currentUserId;
    if (userId == null) return;

    await firestore
        .collection('userMuVisits')
        .doc(userId)
        .collection('visits')
        .doc(muId)
        .set({
      'lastVisited': FieldValue.serverTimestamp(),
    });
  }
}
