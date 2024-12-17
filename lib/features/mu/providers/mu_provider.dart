import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/constants/app_constants.dart';
import '../models/mu_model.dart';

// Single Mu Provider
final muProvider = StreamProvider.family<Mu, String>((ref, muId) {
  return FirebaseFirestore.instance
      .collection(AppConstants.musCollection)
      .doc(muId)
      .snapshots()
      .map((doc) => Mu.fromFirestore(doc));
});

// Recent Mus Provider
final recentMusProvider = FutureProvider<List<Mu>>((ref) async {
  final userId = ref.watch(firebaseServiceProvider).currentUser?.uid;
  if (userId == null) return [];

  final snapshot = await FirebaseFirestore.instance
      .collection('userMuVisits')
      .doc(userId)
      .collection('visits')
      .orderBy('lastVisited', descending: true)
      .limit(10)
      .get();

  final muIds = snapshot.docs.map((doc) => doc.id).toList();
  if (muIds.isEmpty) return [];

  final musSnapshot = await FirebaseFirestore.instance
      .collection(AppConstants.musCollection)
      .where(FieldPath.documentId, whereIn: muIds)
      .get();

  return musSnapshot.docs.map((doc) => Mu.fromFirestore(doc)).toList();
});

// My Mus Provider
final myMusProvider = StreamProvider<List<Mu>>((ref) {
  final userId = ref.watch(firebaseServiceProvider).currentUser?.uid;
  if (userId == null) return Stream.value([]);

  return FirebaseFirestore.instance
      .collection('userMus')
      .doc(userId)
      .collection('joined')
      .snapshots()
      .asyncMap((snapshot) async {
    final muIds = snapshot.docs.map((doc) => doc.id).toList();
    if (muIds.isEmpty) return [];

    final musSnapshot = await FirebaseFirestore.instance
        .collection(AppConstants.musCollection)
        .where(FieldPath.documentId, whereIn: muIds)
        .get();

    return musSnapshot.docs.map((doc) => Mu.fromFirestore(doc)).toList();
  });
});

// Mu Management Provider
class MuManagementState {
  final bool isLoading;
  final String? error;

  MuManagementState({
    this.isLoading = false,
    this.error,
  });

  MuManagementState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return MuManagementState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class MuManagementNotifier extends StateNotifier<MuManagementState> {
  final FirebaseService _firebaseService;

  MuManagementNotifier(this._firebaseService) : super(MuManagementState());

  Future<bool> joinMu(String muId) async {
    final userId = _firebaseService.currentUser?.uid;
    if (userId == null) {
      state = state.copyWith(error: '로그인이 필요합니다');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      // Add to user's joined mus
      await _firebaseService.firestore
          .collection('userMus')
          .doc(userId)
          .collection('joined')
          .doc(muId)
          .set({
        'joinedAt': FieldValue.serverTimestamp(),
      });

      // Increment mu member count
      await _firebaseService.firestore
          .collection(AppConstants.musCollection)
          .doc(muId)
          .update({
        'memberCount': FieldValue.increment(1),
      });

      // Award commore points
      await _firebaseService.awardCommorePoints(
        userId,
        AppConstants.joinMuPoints,
      );

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '뮤 가입에 실패했습니다',
      );
      return false;
    }
  }

  Future<bool> leaveMu(String muId) async {
    final userId = _firebaseService.currentUser?.uid;
    if (userId == null) {
      state = state.copyWith(error: '로그인이 필요합니다');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      // Remove from user's joined mus
      await _firebaseService.firestore
          .collection('userMus')
          .doc(userId)
          .collection('joined')
          .doc(muId)
          .delete();

      // Decrement mu member count
      await _firebaseService.firestore
          .collection(AppConstants.musCollection)
          .doc(muId)
          .update({
        'memberCount': FieldValue.increment(-1),
      });

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '뮤 탈퇴에 실패했습니다',
      );
      return false;
    }
  }

  Future<void> recordVisit(String muId) async {
    final userId = _firebaseService.currentUser?.uid;
    if (userId == null) return;

    try {
      await _firebaseService.firestore
          .collection('userMuVisits')
          .doc(userId)
          .collection('visits')
          .doc(muId)
          .set({
        'lastVisited': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Silent fail for visit recording
      print('Failed to record mu visit: $e');
    }
  }
}

final muManagementProvider =
    StateNotifierProvider<MuManagementNotifier, MuManagementState>((ref) {
  return MuManagementNotifier(ref.watch(firebaseServiceProvider));
});
