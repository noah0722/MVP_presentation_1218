// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      relatedPostId: json['relatedPostId'] as String?,
      relatedCommentId: json['relatedCommentId'] as String?,
      relatedMuId: json['relatedMuId'] as String?,
      isRead: json['isRead'] as bool? ?? false,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'message': instance.message,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'relatedPostId': instance.relatedPostId,
      'relatedCommentId': instance.relatedCommentId,
      'relatedMuId': instance.relatedMuId,
      'isRead': instance.isRead,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.commoreReceived: 'commoreReceived',
  NotificationType.thumbUp: 'thumbUp',
  NotificationType.newComment: 'newComment',
  NotificationType.commentReply: 'commentReply',
  NotificationType.muJoined: 'muJoined',
  NotificationType.adminNotice: 'adminNotice',
};
