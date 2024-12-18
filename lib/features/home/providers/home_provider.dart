import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/app_constants.dart';
import '../models/post_model.dart';

enum FeedType { best, recent, following }

enum PostFilter { all, discussion, official }

enum MuFilter { all, politicsParty, newsPolls, election }

final feedTypeProvider = StateProvider<FeedType>((ref) => FeedType.best);
final postFilterProvider = StateProvider<PostFilter>((ref) => PostFilter.all);
final muFilterProvider = StateProvider<MuFilter>((ref) => MuFilter.all);

class HomeState {
  final List<Post> posts;
  final FeedType feedType;
  final PostFilter postFilter;
  final MuFilter muFilter;
  final bool isLoading;
  final String? error;

  HomeState({
    required this.posts,
    required this.feedType,
    required this.postFilter,
    required this.muFilter,
    required this.isLoading,
    this.error,
  });

  HomeState copyWith({
    List<Post>? posts,
    FeedType? feedType,
    PostFilter? postFilter,
    MuFilter? muFilter,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      posts: posts ?? this.posts,
      feedType: feedType ?? this.feedType,
      postFilter: postFilter ?? this.postFilter,
      muFilter: muFilter ?? this.muFilter,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  final FirebaseFirestore _firestore;

  HomeNotifier(this._firestore)
      : super(HomeState(
          posts: [],
          feedType: FeedType.best,
          postFilter: PostFilter.all,
          muFilter: MuFilter.all,
          isLoading: false,
        ));

  Future<void> fetchPosts() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      Query query = _firestore.collection(AppConstants.postsCollection);

      // Apply feed type filter
      switch (state.feedType) {
        case FeedType.best:
          final sixHoursAgo = DateTime.now().subtract(
            const Duration(hours: AppConstants.bestPostsHours),
          );
          query = query
              .where('createdAt', isGreaterThan: sixHoursAgo)
              .orderBy('createdAt', descending: true)
              .orderBy('totalThumbs', descending: true);
          break;
        case FeedType.recent:
          query = query.orderBy('createdAt', descending: true);
          break;
        case FeedType.following:
          // TODO: Implement following filter when auth is ready
          break;
      }

      // Apply post type filter
      switch (state.postFilter) {
        case PostFilter.discussion:
          query = query.where('isOfficial', isEqualTo: false);
          break;
        case PostFilter.official:
          query = query.where('isOfficial', isEqualTo: true);
          break;
        case PostFilter.all:
          break;
      }

      // Apply mu filter
      switch (state.muFilter) {
        case MuFilter.politicsParty:
          query = query.where('muCategory', whereIn: ['정치인', '정당']);
          break;
        case MuFilter.newsPolls:
          query = query.where('muCategory', whereIn: ['뉴스', '여론조사']);
          break;
        case MuFilter.election:
          query = query.where('muCategory', whereIn: ['여론조사', '선거']);
          break;
        case MuFilter.all:
          break;
      }

      final snapshots = await query.limit(20).get();
      final posts =
          snapshots.docs.map((doc) => Post.fromFirestore(doc)).toList();

      state = state.copyWith(
        posts: posts,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '포스트를 불러오는데 실패했습니다.',
      );
    }
  }

  void setFeedType(FeedType type) {
    state = state.copyWith(feedType: type);
    fetchPosts();
  }

  void setPostFilter(PostFilter filter) {
    state = state.copyWith(postFilter: filter);
    fetchPosts();
  }

  void setMuFilter(MuFilter filter) {
    state = state.copyWith(muFilter: filter);
    fetchPosts();
  }

  Future<void> refreshPosts() async {
    await fetchPosts();
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(FirebaseFirestore.instance);
});
