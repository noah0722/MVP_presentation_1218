// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MuImpl _$$MuImplFromJson(Map<String, dynamic> json) => _$MuImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      bannerImageUrl: json['bannerImageUrl'] as String,
      country: json['country'] as String,
      language: json['language'] as String,
      topicLevel1: json['topicLevel1'] as String,
      topicLevel2: json['topicLevel2'] as String,
      memberCount: (json['memberCount'] as num).toInt(),
      postCount: (json['postCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      officialType: json['officialType'] as String?,
      officialBadgeUrl: json['officialBadgeUrl'] as String?,
      isOfficial: json['isOfficial'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$MuImplToJson(_$MuImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'profileImageUrl': instance.profileImageUrl,
      'bannerImageUrl': instance.bannerImageUrl,
      'country': instance.country,
      'language': instance.language,
      'topicLevel1': instance.topicLevel1,
      'topicLevel2': instance.topicLevel2,
      'memberCount': instance.memberCount,
      'postCount': instance.postCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'officialType': instance.officialType,
      'officialBadgeUrl': instance.officialBadgeUrl,
      'isOfficial': instance.isOfficial,
      'isVerified': instance.isVerified,
    };
