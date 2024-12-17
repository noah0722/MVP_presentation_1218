import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/firebase_service.dart';
import '../models/notification_model.dart';

final userNotificationsProvider =
    StreamProvider<List<NotificationModel>>((ref) {
  final userId = ref.watch(firebaseServiceProvider).currentUser?.uid;
  if (userId == null) return Stream.value([]);

  return FirebaseFirestore.instance
      .collection('notifications')
      .where('userId', isEqualTo: userId)
      .orderBy('createdAt', descending: true)
      .limit(50) // Limit to last 50 notifications
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => NotificationModel.fromFirestore(doc))
          .toList());
});

final unreadNotificationCountProvider = StreamProvider<int>((ref) {
  final userId = ref.watch(firebaseServiceProvider).currentUser?.uid;
  if (userId == null) return Stream.value(0);

  return FirebaseFirestore.instance
      .collection('notifications')
      .where('userId', isEqualTo: userId)
      .where('isRead', isEqualTo: false)
      .snapshots()
      .map((snapshot) => snapshot.docs.length);
});

class NotificationState {
  final bool isLoading;
  final String? error;

  NotificationState({
    this.isLoading = false,
    this.error,
  });
}

class NotificationNotifier extends StateNotifier<NotificationState> {
  final FirebaseService _firebaseService;

  NotificationNotifier(this._firebaseService) : super(NotificationState());

  Future<void> markAsRead(String notificationId) async {
    try {
      await _firebaseService.firestore
          .collection('notifications')
          .doc(notificationId)
          .update({'isRead': true});
    } catch (e) {
      state = NotificationState(error: '알림 상태 업데이트에 실패했습니다');
    }
  }

  Future<void> markAllAsRead() async {
    final userId = _firebaseService.currentUser?.uid;
    if (userId == null) return;

    state = NotificationState(isLoading: true);

    try {
      final batch = _firebaseService.firestore.batch();
      final notifications = await _firebaseService.firestore
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .get();

      for (final doc in notifications.docs) {
        batch.update(doc.reference, {'isRead': true});
      }

      await batch.commit();
      state = NotificationState();
    } catch (e) {
      state = NotificationState(error: '알림 상태 업데이트에 실패했습니다');
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      await _firebaseService.firestore
          .collection('notifications')
          .doc(notificationId)
          .delete();
    } catch (e) {
      state = NotificationState(error: '알림 삭제에 실패했습니다');
    }
  }

  Future<void> deleteAllNotifications() async {
    final userId = _firebaseService.currentUser?.uid;
    if (userId == null) return;

    state = NotificationState(isLoading: true);

    try {
      final batch = _firebaseService.firestore.batch();
      final notifications = await _firebaseService.firestore
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .get();

      for (final doc in notifications.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
      state = NotificationState();
    } catch (e) {
      state = NotificationState(error: '알림 삭제에 실패했습니다');
    }
  }

  Future<void> createNotification({
    required String userId,
    required String title,
    required String message,
    required NotificationType type,
    String? relatedPostId,
    String? relatedCommentId,
    String? relatedMuId,
  }) async {
    try {
      await _firebaseService.firestore.collection('notifications').add({
        'userId': userId,
        'title': title,
        'message': message,
        'type': type.toString(),
        'createdAt': FieldValue.serverTimestamp(),
        'relatedPostId': relatedPostId,
        'relatedCommentId': relatedCommentId,
        'relatedMuId': relatedMuId,
        'isRead': false,
      });
    } catch (e) {
      state = NotificationState(error: '알림 생성에 실패했습니다');
    }
  }
}

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier(ref.watch(firebaseServiceProvider));
});
