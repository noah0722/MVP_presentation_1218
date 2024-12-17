// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      postId: json['postId'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      thumbsUp: (json['thumbsUp'] as num).toInt(),
      thumbsDown: (json['thumbsDown'] as num).toInt(),
      parentId: json['parentId'] as String?,
      level: (json['level'] as num).toInt(),
      mentions: (json['mentions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isUserThumbUp: json['isUserThumbUp'] as bool? ?? false,
      isUserThumbDown: json['isUserThumbDown'] as bool? ?? false,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'thumbsUp': instance.thumbsUp,
      'thumbsDown': instance.thumbsDown,
      'parentId': instance.parentId,
      'level': instance.level,
      'mentions': instance.mentions,
      'isUserThumbUp': instance.isUserThumbUp,
      'isUserThumbDown': instance.isUserThumbDown,
    };
