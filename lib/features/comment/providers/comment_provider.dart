import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/constants/app_constants.dart';
import '../models/comment_model.dart';

final commentSortTypeProvider = StateProvider<String>((ref) => 'best');

final commentsProvider =
    StreamProvider.family<List<Comment>, String>((ref, postId) {
  final sortType = ref.watch(commentSortTypeProvider);

  Query query = FirebaseFirestore.instance
      .collection(AppConstants.commentsCollection)
      .where('postId', isEqualTo: postId);

  if (sortType == 'best') {
    query = query
        .orderBy('thumbsUp', descending: true)
        .orderBy('createdAt', descending: true);
  } else {
    query = query.orderBy('createdAt', descending: true);
  }

  return query.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Comment.fromFirestore(doc)).toList());
});

class CommentState {
  final bool isLoading;
  final String? error;
  final String? replyTo;
  final String content;

  CommentState({
    this.isLoading = false,
    this.error,
    this.replyTo,
    this.content = '',
  });
}

class CommentNotifier extends StateNotifier<CommentState> {
  final FirebaseService _firebaseService;

  CommentNotifier(this._firebaseService) : super(CommentState());

  void setContent(String content) {
    state = CommentState(content: content, replyTo: state.replyTo);
  }

  void setReplyTo(String? commentId) {
    state = CommentState(content: state.content, replyTo: commentId);
  }

  Future<bool> createComment(String postId) async {
    if (state.content.trim().isEmpty) {
      state = CommentState(error: '댓글을 입력해주세요');
      return false;
    }

    state = CommentState(isLoading: true);

    try {
      final user = _firebaseService.currentUser;
      if (user == null) throw Exception('로그인이 필요합니다');

      final comment = {
        'postId': postId,
        'authorId': user.uid,
        'authorName': user.displayName ?? '익명',
        'content': state.content,
        'createdAt': FieldValue.serverTimestamp(),
        'thumbsUp': 0,
        'thumbsDown': 0,
        'parentId': state.replyTo,
        'level':
            state.replyTo != null ? await _getCommentLevel(state.replyTo!) : 1,
        'mentions': _extractMentions(state.content),
      };

      // Create comment
      final commentRef = await _firebaseService.firestore
          .collection(AppConstants.commentsCollection)
          .add(comment);

      // Update post comment count
      await _firebaseService.firestore
          .collection(AppConstants.postsCollection)
          .doc(postId)
          .update({
        'commentCount': FieldValue.increment(1),
      });

      // Award points
      await _firebaseService.awardCommorePoints(
        user.uid,
        state.replyTo != null
            ? AppConstants.replyPoints
            : AppConstants.commentPoints,
      );

      state = CommentState();
      return true;
    } catch (e) {
      state = CommentState(error: '댓글 작성에 실패했습니다');
      return false;
    }
  }

  Future<bool> reactToComment(String commentId, bool isThumbUp) async {
    try {
      final user = _firebaseService.currentUser;
      if (user == null) throw Exception('로그인이 필요합니다');

      final reactionRef = _firebaseService.firestore
          .collection('commentReactions')
          .doc('${user.uid}_$commentId');

      final reactionDoc = await reactionRef.get();
      final commentRef = _firebaseService.firestore
          .collection(AppConstants.commentsCollection)
          .doc(commentId);

      if (reactionDoc.exists) {
        final currentReaction = reactionDoc.data()?['isThumbUp'] as bool;
        if (currentReaction == isThumbUp) {
          // Cancel reaction
          await reactionRef.delete();
          await commentRef.update({
            isThumbUp ? 'thumbsUp' : 'thumbsDown': FieldValue.increment(-1),
          });
        } else {
          // Change reaction
          await reactionRef.update({'isThumbUp': isThumbUp});
          await commentRef.update({
            'thumbsUp': FieldValue.increment(isThumbUp ? 1 : -1),
            'thumbsDown': FieldValue.increment(isThumbUp ? -1 : 1),
          });
        }
      } else {
        // New reaction
        await reactionRef.set({'isThumbUp': isThumbUp});
        await commentRef.update({
          isThumbUp ? 'thumbsUp' : 'thumbsDown': FieldValue.increment(1),
        });
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<int> _getCommentLevel(String parentId) async {
    final parentDoc = await _firebaseService.firestore
        .collection(AppConstants.commentsCollection)
        .doc(parentId)
        .get();

    final parentLevel = parentDoc.data()?['level'] as int? ?? 0;
    return parentLevel + 1;
  }

  List<String> _extractMentions(String content) {
    final regex = RegExp(r'@(\w+)');
    return regex.allMatches(content).map((match) => match.group(1)!).toList();
  }
}

final commentProvider =
    StateNotifierProvider<CommentNotifier, CommentState>((ref) {
  return CommentNotifier(ref.watch(firebaseServiceProvider));
});
