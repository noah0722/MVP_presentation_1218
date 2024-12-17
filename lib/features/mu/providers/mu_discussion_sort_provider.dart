import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MuSortType {
  best,
  recent,
}

class MuDiscussionSortState {
  final MuSortType sortType;

  MuDiscussionSortState({
    this.sortType = MuSortType.best,
  });
}

class MuDiscussionSortNotifier extends StateNotifier<MuDiscussionSortState> {
  MuDiscussionSortNotifier() : super(MuDiscussionSortState());

  void setSortType(MuSortType type) {
    state = MuDiscussionSortState(sortType: type);
  }
}

final muDiscussionSortProvider =
    StateNotifierProvider<MuDiscussionSortNotifier, MuDiscussionSortState>(
        (ref) {
  return MuDiscussionSortNotifier();
});

// Convenience provider for just the sort type
final muDiscussionSortTypeProvider = Provider<MuSortType>((ref) {
  return ref.watch(muDiscussionSortProvider).sortType;
});
