import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/constants/app_constants.dart';
import '../models/profile_model.dart';

final profileProvider = StreamProvider.family<Profile, String>((ref, userId) {
  return FirebaseFirestore.instance
      .collection(AppConstants.usersCollection)
      .doc(userId)
      .snapshots()
      .map((doc) => Profile.fromFirestore(doc));
});

final currentProfileProvider = StreamProvider<Profile?>((ref) {
  final userId = ref.watch(firebaseServiceProvider).currentUser?.uid;
  if (userId == null) return Stream.value(null);
  return FirebaseFirestore.instance
      .collection(AppConstants.usersCollection)
      .doc(userId)
      .snapshots()
      .map((doc) => Profile.fromFirestore(doc));
});

final commoreTransactionsProvider =
    StreamProvider.family<List<CommoreTransaction>, String>((ref, userId) {
  return FirebaseFirestore.instance
      .collection(AppConstants.commoreTransactionsCollection)
      .where('userId', isEqualTo: userId)
      .orderBy('timestamp', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => CommoreTransaction.fromFirestore(doc))
          .toList());
});

class ProfileState {
  final bool isLoading;
  final String? error;

  ProfileState({
    this.isLoading = false,
    this.error,
  });
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final FirebaseService _firebaseService;

  ProfileNotifier(this._firebaseService) : super(ProfileState());

  Future<bool> updateDisplayName(String newName) async {
    if (newName.trim().length < 2) {
      state = ProfileState(error: '닉네임은 2글자 이상이어야합니다');
      return false;
    }

    state = ProfileState(isLoading: true);

    try {
      final user = _firebaseService.currentUser;
      if (user == null) throw Exception('로그인이 필요합니다');

      // Update user profile
      await user.updateDisplayName(newName);

      // Update Firestore profile
      await _firebaseService.firestore
          .collection(AppConstants.usersCollection)
          .doc(user.uid)
          .update({
        'displayName': newName,
      });

      state = ProfileState();
      return true;
    } catch (e) {
      state = ProfileState(error: '프로필 업데이트에 실패했습니다');
      return false;
    }
  }

  Future<bool> deleteAccount() async {
    state = ProfileState(isLoading: true);

    try {
      final user = _firebaseService.currentUser;
      if (user == null) throw Exception('로그인이 필요합니다');

      // Delete user data
      await _firebaseService.firestore
          .collection(AppConstants.usersCollection)
          .doc(user.uid)
          .delete();

      // Delete user authentication
      await user.delete();

      state = ProfileState();
      return true;
    } catch (e) {
      state = ProfileState(error: '계정 삭제에 실패했습니다');
      return false;
    }
  }
}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(ref.watch(firebaseServiceProvider));
});
