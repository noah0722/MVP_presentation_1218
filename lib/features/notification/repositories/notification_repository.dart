import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/data/repositories/base_repository.dart';
import '../../../core/services/firebase_service.dart';
import '../models/notification_model.dart';

class NotificationRepository extends BaseRepository {
  NotificationRepository(super.firebaseService);

  @override
  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.collection('notifications');

  Future<void> createNotification({
    required String userId,
    required String title,
    required String message,
    required NotificationType type,
    String? relatedPostId,
    String? relatedCommentId,
    String? relatedMuId,
  }) async {
    await collection.add({
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
  }

  Future<void> createCommoreNotification({
    required String userId,
    required int points,
    required String action,
  }) async {
    await createNotification(
      userId: userId,
      title: '코몰 획득',
      message: '$action으로 $points 코몰을 획득했어요!',
      type: NotificationType.commoreReceived,
    );
  }

  Future<void> createThumbUpNotification({
    required String userId,
    required String postId,
    String? commentId,
  }) async {
    await createNotification(
      userId: userId,
      title: commentId != null ? '댓글 공감' : '포스트 공감',
      message: commentId != null ? '댓글에 공감을 받았어요' : '포스트에 공감을 받았어요',
      type: NotificationType.thumbUp,
      relatedPostId: postId,
      relatedCommentId: commentId,
    );
  }

  Future<void> createCommentNotification({
    required String userId,
    required String postId,
    String? parentCommentId,
  }) async {
    await createNotification(
      userId: userId,
      title: parentCommentId != null ? '답글 작성' : '댓글 작성',
      message: parentCommentId != null ? '댓글에 답글이 달렸어요' : '포스트에 댓글이 달렸어요',
      type: parentCommentId != null
          ? NotificationType.commentReply
          : NotificationType.newComment,
      relatedPostId: postId,
      relatedCommentId: parentCommentId,
    );
  }

  Future<void> createMuJoinNotification({
    required String userId,
    required String muId,
    required String muName,
  }) async {
    await createNotification(
      userId: userId,
      title: '뮤 가입',
      message: 'mu/$muName 뮤에 가입했어요',
      type: NotificationType.muJoined,
      relatedMuId: muId,
    );
  }

  Future<void> createAdminNotification({
    required List<String> userIds,
    required String title,
    required String message,
  }) async {
    final batch = firestore.batch();
    for (final userId in userIds) {
      final notificationRef = collection.doc();
      batch.set(notificationRef, {
        'userId': userId,
        'title': title,
        'message': message,
        'type': NotificationType.adminNotice.toString(),
        'createdAt': FieldValue.serverTimestamp(),
        'isRead': false,
      });
    }
    await batch.commit();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotificationsStream() {
    final userId = currentUserId;
    if (userId == null) return const Stream.empty();

    return collection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots();
  }

  Future<void> markAsRead(String notificationId) async {
    await collection.doc(notificationId).update({'isRead': true});
  }

  Future<void> markAllAsRead() async {
    final userId = currentUserId;
    if (userId == null) return;

    final batch = firestore.batch();
    final notifications = await collection
        .where('userId', isEqualTo: userId)
        .where('isRead', isEqualTo: false)
        .get();

    for (final doc in notifications.docs) {
      batch.update(doc.reference, {'isRead': true});
    }

    await batch.commit();
  }

  Future<void> deleteAllNotifications() async {
    final userId = currentUserId;
    if (userId == null) return;

    final batch = firestore.batch();
    final notifications =
        await collection.where('userId', isEqualTo: userId).get();

    for (final doc in notifications.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }
}
