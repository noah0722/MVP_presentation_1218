import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'mu_model.freezed.dart';
part 'mu_model.g.dart';

@freezed
class Mu with _$Mu {
  const factory Mu({
    required String id,
    required String name,
    required String description,
    required String profileImageUrl,
    required String bannerImageUrl,
    required String country,
    required String language,
    required String topicLevel1,
    required String topicLevel2,
    required int memberCount,
    required int postCount,
    required DateTime createdAt,
    String? officialType, // 정치인, 정당, 미디어, etc.
    String? officialBadgeUrl, // URL for badge icons (국회의원, 대통령, etc.)
    @Default(false) bool isOfficial,
    @Default(false) bool isVerified,
  }) = _Mu;

  factory Mu.fromJson(Map<String, dynamic> json) => _$MuFromJson(json);

  factory Mu.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Mu(
      id: doc.id,
      name: data['name'] as String,
      description: data['description'] as String,
      profileImageUrl: data['profileImageUrl'] as String,
      bannerImageUrl: data['bannerImageUrl'] as String,
      country: data['country'] as String,
      language: data['language'] as String,
      topicLevel1: data['topicLevel1'] as String,
      topicLevel2: data['topicLevel2'] as String,
      memberCount: data['memberCount'] as int,
      postCount: data['postCount'] as int,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      officialType: data['officialType'] as String?,
      officialBadgeUrl: data['officialBadgeUrl'] as String?,
      isOfficial: data['isOfficial'] as bool? ?? false,
      isVerified: data['isVerified'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'profileImageUrl': profileImageUrl,
      'bannerImageUrl': bannerImageUrl,
      'country': country,
      'language': language,
      'topicLevel1': topicLevel1,
      'topicLevel2': topicLevel2,
      'memberCount': memberCount,
      'postCount': postCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'officialType': officialType,
      'officialBadgeUrl': officialBadgeUrl,
      'isOfficial': isOfficial,
      'isVerified': isVerified,
    };
  }
}
