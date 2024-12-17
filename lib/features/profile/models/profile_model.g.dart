// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      commorePoints: (json['commorePoints'] as num).toInt(),
      postCount: (json['postCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: DateTime.parse(json['lastLoginAt'] as String),
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'commorePoints': instance.commorePoints,
      'postCount': instance.postCount,
      'commentCount': instance.commentCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt.toIso8601String(),
      'isAdmin': instance.isAdmin,
    };

_$CommoreTransactionImpl _$$CommoreTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$CommoreTransactionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      points: (json['points'] as num).toInt(),
      type: json['type'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CommoreTransactionImplToJson(
        _$CommoreTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'points': instance.points,
      'type': instance.type,
      'timestamp': instance.timestamp.toIso8601String(),
      'description': instance.description,
    };
