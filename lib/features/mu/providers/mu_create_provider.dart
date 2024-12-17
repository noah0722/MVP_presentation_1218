import 'package:commune/core/providers/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/mu_repository.dart';

class MuCreateState {
  final bool isLoading;
  final String? error;
  final String? profileImageUrl;
  final String? bannerImageUrl;

  MuCreateState({
    this.isLoading = false,
    this.error,
    this.profileImageUrl,
    this.bannerImageUrl,
  });

  get profileImage => null;

  get bannerImage => null;
}

class MuCreateNotifier extends StateNotifier<MuCreateState> {
  final MuRepository _repository;

  MuCreateNotifier(this._repository) : super(MuCreateState());

  Future<bool> createMu({
    required String name,
    required String description,
    required String topicLevel1,
    required String topicLevel2,
    required String country,
    required String language,
    String? officialType,
  }) async {
    state = MuCreateState(isLoading: true);

    try {
      await _repository.createMu(
        name: name,
        description: description,
        profileImageUrl: state.profileImageUrl ?? '',
        bannerImageUrl: state.bannerImageUrl ?? '',
        country: country,
        language: language,
        topicLevel1: topicLevel1,
        topicLevel2: topicLevel2,
        officialType: officialType,
      );

      state = MuCreateState();
      return true;
    } catch (e) {
      state = MuCreateState(error: '뮤 생성에 실패했습니다');
      return false;
    }
  }

  void setProfileImage(String url) {
    state = MuCreateState(
      profileImageUrl: url,
      bannerImageUrl: state.bannerImageUrl,
    );
  }

  void setBannerImage(String url) {
    state = MuCreateState(
      profileImageUrl: state.profileImageUrl,
      bannerImageUrl: url,
    );
  }
}

final muCreateProvider =
    StateNotifierProvider<MuCreateNotifier, MuCreateState>((ref) {
  return MuCreateNotifier(ref.watch(muRepositoryProvider));
});
