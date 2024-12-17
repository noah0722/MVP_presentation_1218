import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class Profile with _$Profile {
  Profile._(); // Add private constructor

  factory Profile({
    required String id,
    required String email,
    required String displayName,
    required int commorePoints,
    required int postCount,
    required int commentCount,
    required DateTime createdAt,
    required DateTime lastLoginAt,
    @Default(false) bool isAdmin,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  factory Profile.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Profile(
      id: doc.id,
      email: data['email'] as String,
      displayName: data['displayName'] as String,
      commorePoints: data['commorePoints'] as int? ?? 0,
      postCount: data['postCount'] as int? ?? 0,
      commentCount: data['commentCount'] as int? ?? 0,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      lastLoginAt: (data['lastLoginAt'] as Timestamp).toDate(),
      isAdmin: data['isAdmin'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'commorePoints': commorePoints,
      'postCount': postCount,
      'commentCount': commentCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'lastLoginAt': Timestamp.fromDate(lastLoginAt),
      'isAdmin': isAdmin,
    };
  }
}

@freezed
class CommoreTransaction with _$CommoreTransaction {
  const factory CommoreTransaction({
    required String id,
    required String userId,
    required int points,
    required String type,
    required DateTime timestamp,
    String? description,
  }) = _CommoreTransaction;

  factory CommoreTransaction.fromJson(Map<String, dynamic> json) =>
      _$CommoreTransactionFromJson(json);

  factory CommoreTransaction.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CommoreTransaction(
      id: doc.id,
      userId: data['userId'] as String,
      points: data['points'] as int,
      type: data['type'] as String,
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      description: data['description'] as String?,
    );
  }
}
