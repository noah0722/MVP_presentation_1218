import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class Post with _$Post {
  const Post._();

  const factory Post({
    required String id,
    required String muId,
    required String muName,
    required String muProfileImage,
    required String title,
    required String content,
    required String type,
    required DateTime createdAt,
    required int thumbsUp,
    required int thumbsDown,
    required int commentCount,
    required bool isOfficial,
    String? authorId,
    String? authorName,
    List<String>? images,
    String? videoUrl,
    String? linkUrl,
    String? linkPreview,
    Map<String, dynamic>? pollData,
    @Default(false) bool isUserThumbUp,
    @Default(false) bool isUserThumbDown,
  }) = _Post;

  int get totalThumbs => thumbsUp - thumbsDown;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      muId: data['muId'] as String,
      muName: data['muName'] as String,
      muProfileImage: data['muProfileImage'] as String,
      title: data['title'] as String,
      content: data['content'] as String,
      type: data['type'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      thumbsUp: data['thumbsUp'] as int,
      thumbsDown: data['thumbsDown'] as int,
      commentCount: data['commentCount'] as int,
      isOfficial: data['isOfficial'] as bool? ?? false,
      authorId: data['authorId'] as String?,
      authorName: data['authorName'] as String?,
      images: (data['images'] as List<dynamic>?)?.cast<String>(),
      videoUrl: data['videoUrl'] as String?,
      linkUrl: data['linkUrl'] as String?,
      linkPreview: data['linkPreview'] as String?,
      pollData: data['pollData'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'muId': muId,
      'muName': muName,
      'muProfileImage': muProfileImage,
      'title': title,
      'content': content,
      'type': type,
      'createdAt': Timestamp.fromDate(createdAt),
      'thumbsUp': thumbsUp,
      'thumbsDown': thumbsDown,
      'commentCount': commentCount,
      'isOfficial': isOfficial,
      'authorId': authorId,
      'authorName': authorName,
      'images': images,
      'videoUrl': videoUrl,
      'linkUrl': linkUrl,
      'linkPreview': linkPreview,
      'pollData': pollData,
    };
  }
}
