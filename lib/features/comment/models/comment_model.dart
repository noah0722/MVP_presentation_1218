import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String postId,
    required String authorId,
    required String authorName,
    required String content,
    required DateTime createdAt,
    required int thumbsUp,
    required int thumbsDown,
    String? parentId,
    required int level,
    @Default([]) List<String> mentions,
    @Default(false) bool isUserThumbUp,
    @Default(false) bool isUserThumbDown,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  factory Comment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Comment(
      id: doc.id,
      postId: data['postId'] as String,
      authorId: data['authorId'] as String,
      authorName: data['authorName'] as String,
      content: data['content'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      thumbsUp: data['thumbsUp'] as int,
      thumbsDown: data['thumbsDown'] as int,
      parentId: data['parentId'] as String?,
      level: data['level'] as int,
      mentions: (data['mentions'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'postId': postId,
      'authorId': authorId,
      'authorName': authorName,
      'content': content,
      'createdAt': Timestamp.fromDate(createdAt),
      'thumbsUp': thumbsUp,
      'thumbsDown': thumbsDown,
      'parentId': parentId,
      'level': level,
      'mentions': mentions,
    };
  }
}
