import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

enum NotificationType {
  commoreReceived,
  thumbUp,
  newComment,
  commentReply,
  muJoined,
  adminNotice,
}

@freezed
class NotificationModel with _$NotificationModel {
  NotificationModel._();
  factory NotificationModel({
    required String id,
    required String userId,
    required String title,
    required String message,
    required NotificationType type,
    required DateTime createdAt,
    String? relatedPostId,
    String? relatedCommentId,
    String? relatedMuId,
    @Default(false) bool isRead,
  }) = _Notification;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NotificationModel(
      id: doc.id,
      userId: data['userId'] as String,
      title: data['title'] as String,
      message: data['message'] as String,
      type: NotificationType.values.firstWhere(
        (e) => e.toString() == data['type'],
      ),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      relatedPostId: data['relatedPostId'] as String?,
      relatedCommentId: data['relatedCommentId'] as String?,
      relatedMuId: data['relatedMuId'] as String?,
      isRead: data['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'message': message,
      'type': type.toString(),
      'createdAt': Timestamp.fromDate(createdAt),
      'relatedPostId': relatedPostId,
      'relatedCommentId': relatedCommentId,
      'relatedMuId': relatedMuId,
      'isRead': isRead,
    };
  }
}
