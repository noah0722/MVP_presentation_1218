import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/services/firebase_service.dart';
import '../../../core/constants/app_constants.dart';

enum PostType { text, image, video, link, poll }

class PostCreateState {
  final String? selectedMuId;
  final String? title;
  final String? content;
  final PostType type;
  final List<File> images;
  final File? video;
  final String? linkUrl;
  final List<String> pollOptions;
  final bool isLoading;
  final String? error;

  PostCreateState({
    this.selectedMuId,
    this.title,
    this.content,
    this.type = PostType.text,
    this.images = const [],
    this.video,
    this.linkUrl,
    this.pollOptions = const [],
    this.isLoading = false,
    this.error,
  });

  bool get isValid {
    if (selectedMuId == null || title!.trim().isEmpty ?? true) return false;

    switch (type) {
      case PostType.text:
        return content?.trim().isNotEmpty ?? false;
      case PostType.image:
        return images.isNotEmpty;
      case PostType.video:
        return video != null;
      case PostType.link:
        return linkUrl?.trim().isNotEmpty ?? false;
      case PostType.poll:
        return pollOptions.length >= 2 &&
            pollOptions.every((option) => option.trim().isNotEmpty);
    }
  }

  PostCreateState copyWith({
    String? selectedMuId,
    String? title,
    String? content,
    PostType? type,
    List<File>? images,
    File? video,
    String? linkUrl,
    List<String>? pollOptions,
    bool? isLoading,
    String? error,
  }) {
    return PostCreateState(
      selectedMuId: selectedMuId ?? this.selectedMuId,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      images: images ?? this.images,
      video: video ?? this.video,
      linkUrl: linkUrl ?? this.linkUrl,
      pollOptions: pollOptions ?? this.pollOptions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class PostCreateNotifier extends StateNotifier<PostCreateState> {
  final FirebaseService _firebaseService;
  final ImagePicker _imagePicker = ImagePicker();

  PostCreateNotifier(this._firebaseService) : super(PostCreateState());

  void setMu(String muId) {
    state = state.copyWith(selectedMuId: muId);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContent(String content) {
    state = state.copyWith(content: content);
  }

  void setType(PostType type) {
    state = state.copyWith(
      type: type,
      images: type == PostType.image ? state.images : [],
      video: type == PostType.video ? state.video : null,
      linkUrl: type == PostType.link ? state.linkUrl : null,
      pollOptions: type == PostType.poll ? state.pollOptions : [],
    );
  }

  Future<void> pickImages() async {
    try {
      final images = await _imagePicker.pickMultiImage();
      final files = images.map((xFile) => File(xFile.path)).toList();
      state = state.copyWith(
        type: PostType.image,
        images: [...state.images, ...files],
      );
    } catch (e) {
      state = state.copyWith(error: '이미지를 선택하는데 실패했습니다');
    }
  }

  Future<void> pickVideo() async {
    try {
      final video = await _imagePicker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        state = state.copyWith(
          type: PostType.video,
          video: File(video.path),
        );
      }
    } catch (e) {
      state = state.copyWith(error: '비디오를 선택하는데 실패했습니다');
    }
  }

  void setLinkUrl(String url) {
    state = state.copyWith(linkUrl: url);
  }

  void addPollOption(String option) {
    if (state.pollOptions.length < 10) {
      state = state.copyWith(
        pollOptions: [...state.pollOptions, option],
      );
    }
  }

  void removePollOption(int index) {
    final newOptions = List<String>.from(state.pollOptions);
    newOptions.removeAt(index);
    state = state.copyWith(pollOptions: newOptions);
  }

  void updatePollOption(int index, String newOption) {
    final newOptions = List<String>.from(state.pollOptions);
    newOptions[index] = newOption;
    state = state.copyWith(pollOptions: newOptions);
  }

  Future<bool> createPost() async {
    if (!state.isValid) {
      state = state.copyWith(error: '필수 항목을 모두 입력해주세요');
      return false;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final currentUser = _firebaseService.currentUser;
      if (currentUser == null) throw Exception('로그인이 필요합니다');

      String? mediaUrl;
      List<String>? imageUrls;

      // Upload media if needed
      switch (state.type) {
        case PostType.image:
          imageUrls = await Future.wait(
            state.images.map((file) async {
              final path =
                  '${AppConstants.postImagesPath}/${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
              return await _firebaseService.uploadFile(
                  path, await file.readAsBytes());
            }),
          );
          break;
        case PostType.video:
          if (state.video != null) {
            final path =
                '${AppConstants.postVideosPath}/${DateTime.now().millisecondsSinceEpoch}_${state.video!.path.split('/').last}';
            mediaUrl = await _firebaseService.uploadFile(
                path, await state.video!.readAsBytes());
          }
          break;
        default:
          break;
      }

      // Create post document
      await _firebaseService.firestore
          .collection(AppConstants.postsCollection)
          .add({
        'muId': state.selectedMuId,
        'authorId': currentUser.uid,
        'authorName': currentUser.displayName,
        'title': state.title,
        'content': state.content,
        'type': state.type.toString(),
        'images': imageUrls,
        'videoUrl': mediaUrl,
        'linkUrl': state.linkUrl,
        'pollOptions': state.type == PostType.poll
            ? state.pollOptions
                .map((option) => {
                      'text': option,
                      'votes': 0,
                    })
                .toList()
            : null,
        'thumbsUp': 0,
        'thumbsDown': 0,
        'commentCount': 0,
        'createdAt': DateTime.now(),
      });

      // Award points for creating post
      await _firebaseService.awardCommorePoints(
        currentUser.uid,
        AppConstants.createPostPoints,
      );

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '포스트 작성에 실패했습니다',
      );
      return false;
    }
  }

  void reset() {
    state = PostCreateState();
  }
}

final postCreateProvider =
    StateNotifierProvider<PostCreateNotifier, PostCreateState>((ref) {
  return PostCreateNotifier(ref.watch(firebaseServiceProvider));
});
