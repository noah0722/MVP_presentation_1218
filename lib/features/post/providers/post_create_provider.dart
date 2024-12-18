// lib/features/post/providers/post_create_provider.dart

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/services/firebase_service.dart';

enum PostType { text, image, video, link, poll }

class PostCreateState {
  final bool isLoading;
  final String? error;
  final String? selectedMuId;
  final PostType type;
  final List<File> images;
  final File? video;
  final String? linkUrl;
  final List<String> pollOptions;

  PostCreateState({
    this.isLoading = false,
    this.error,
    this.selectedMuId,
    this.type = PostType.text,
    this.images = const [],
    this.video,
    this.linkUrl,
    this.pollOptions = const [],
  });

  bool get isValid => selectedMuId != null;
}

class PostCreateNotifier extends StateNotifier<PostCreateState> {
  final FirebaseService _firebaseService;

  PostCreateNotifier(this._firebaseService) : super(PostCreateState());

  void setMu(String muId) {
    state = PostCreateState(selectedMuId: muId);
  }

  void setType(PostType type) {
    state = PostCreateState(type: type, selectedMuId: state.selectedMuId);
  }

  void addImages(List<XFile> imageFiles) {
    state = PostCreateState(
      type: PostType.image,
      selectedMuId: state.selectedMuId,
      images: [...state.images, ...imageFiles.map((x) => File(x.path))],
    );
  }

  void setVideo(XFile videoFile) {
    state = PostCreateState(
      type: PostType.video,
      selectedMuId: state.selectedMuId,
      video: File(videoFile.path),
    );
  }

  void setLinkUrl(String url) {
    state = PostCreateState(
      type: PostType.link,
      selectedMuId: state.selectedMuId,
      linkUrl: url,
    );
  }

  void addPollOption(String option) {
    if (state.pollOptions.length < 10) {
      state = PostCreateState(
        type: PostType.poll,
        selectedMuId: state.selectedMuId,
        pollOptions: [...state.pollOptions, option],
      );
    }
  }

  void removePollOption(int index) {
    final newOptions = List<String>.from(state.pollOptions)..removeAt(index);
    state = PostCreateState(
      type: PostType.poll,
      selectedMuId: state.selectedMuId,
      pollOptions: newOptions,
    );
  }

  void updatePollOption(int index, String value) {
    final newOptions = List<String>.from(state.pollOptions);
    newOptions[index] = value;
    state = PostCreateState(
      type: PostType.poll,
      selectedMuId: state.selectedMuId,
      pollOptions: newOptions,
    );
  }

  Future<bool> createPost(String title, String content) async {
    state = PostCreateState(isLoading: true);
    // TODO: Implement post creation with Firebase
    return true;
  }
}

final postCreateProvider =
    StateNotifierProvider<PostCreateNotifier, PostCreateState>((ref) {
  return PostCreateNotifier(ref.watch(firebaseServiceProvider));
});
