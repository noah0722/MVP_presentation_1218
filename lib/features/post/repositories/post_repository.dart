import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/data/repositories/base_repository.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/constants/app_constants.dart';

class PostRepository extends BaseRepository {
  PostRepository(FirebaseService firebaseService) : super(firebaseService);

  @override
  CollectionReference<Map<String, dynamic>> get collection =>
      firestore.collection(AppConstants.postsCollection);

  Stream<QuerySnapshot<Map<String, dynamic>>> getPostsStream({
    String? muId,
    String? authorId,
    required String sortType,
    String? postFilter,
    String? muFilter,
  }) {
    Query<Map<String, dynamic>> query = collection;

    if (muId != null) {
      query = query.where('muId', isEqualTo: muId);
    }

    if (authorId != null) {
      query = query.where('authorId', isEqualTo: authorId);
    }

    if (postFilter == 'discussion') {
      query = query.where('isOfficial', isEqualTo: false);
    } else if (postFilter == 'official') {
      query = query.where('isOfficial', isEqualTo: true);
    }

    if (muFilter == 'politicsParty') {
      query = query.where('muCategory', whereIn: ['정치인', '정당']);
    } else if (muFilter == 'newsPolls') {
      query = query.where('muCategory', whereIn: ['뉴스', '여론조사']);
    } else if (muFilter == 'election') {
      query = query.where('muCategory', whereIn: ['여론조사', '선거']);
    }

    if (sortType == 'best') {
      final sixHoursAgo = DateTime.now().subtract(
        const Duration(hours: AppConstants.bestPostsHours),
      );
      query = query
          .where('createdAt', isGreaterThan: sixHoursAgo)
          .orderBy('createdAt', descending: true)
          .orderBy('totalThumbs', descending: true);
    } else {
      query = query.orderBy('createdAt', descending: true);
    }

    return query.limit(20).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFollowingPostsStream() async* {
    final userId = currentUserId;
    if (userId == null) yield* const Stream.empty();

    final userMus = await firestore
        .collection('userMus')
        .doc(userId)
        .collection('joined')
        .get();

    final muIds = userMus.docs.map((doc) => doc.id).toList();
    if (muIds.isEmpty) yield* const Stream.empty();

    yield* collection
        .where('muId', whereIn: muIds)
        .orderBy('createdAt', descending: true)
        .limit(20)
        .snapshots();
  }

  Future<void> incrementCommentCount(String postId) async {
    await collection.doc(postId).update({
      'commentCount': FieldValue.increment(1),
    });
  }

  Future<void> decrementCommentCount(String postId) async {
    await collection.doc(postId).update({
      'commentCount': FieldValue.increment(-1),
    });
  }

  Future<void> votePoll(String postId, int optionIndex) async {
    final userId = currentUserId;
    if (userId == null) throw Exception('Not authenticated');

    final voteRef = firestore.collection('pollVotes').doc('${userId}_$postId');

    final voteDoc = await voteRef.get();
    if (voteDoc.exists) throw Exception('Already voted');

    await voteRef.set({
      'userId': userId,
      'postId': postId,
      'optionIndex': optionIndex,
      'createdAt': FieldValue.serverTimestamp(),
    });

    await collection.doc(postId).update({
      'pollData.options.$optionIndex.votes': FieldValue.increment(1),
    });
  }
}
