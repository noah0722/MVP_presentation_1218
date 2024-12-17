// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      muId: json['muId'] as String,
      muName: json['muName'] as String,
      muProfileImage: json['muProfileImage'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      thumbsUp: (json['thumbsUp'] as num).toInt(),
      thumbsDown: (json['thumbsDown'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      isOfficial: json['isOfficial'] as bool,
      authorId: json['authorId'] as String?,
      authorName: json['authorName'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videoUrl: json['videoUrl'] as String?,
      linkUrl: json['linkUrl'] as String?,
      linkPreview: json['linkPreview'] as String?,
      pollData: json['pollData'] as Map<String, dynamic>?,
      isUserThumbUp: json['isUserThumbUp'] as bool? ?? false,
      isUserThumbDown: json['isUserThumbDown'] as bool? ?? false,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'muId': instance.muId,
      'muName': instance.muName,
      'muProfileImage': instance.muProfileImage,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
      'thumbsUp': instance.thumbsUp,
      'thumbsDown': instance.thumbsDown,
      'commentCount': instance.commentCount,
      'isOfficial': instance.isOfficial,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'images': instance.images,
      'videoUrl': instance.videoUrl,
      'linkUrl': instance.linkUrl,
      'linkPreview': instance.linkPreview,
      'pollData': instance.pollData,
      'isUserThumbUp': instance.isUserThumbUp,
      'isUserThumbDown': instance.isUserThumbDown,
    };
