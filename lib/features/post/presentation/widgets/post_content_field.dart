import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../providers/post_create_provider.dart';
import 'poll_option_list.dart';

class PostContentField extends StatelessWidget {
  final PostType type;
  final String? content;
  final List<File> images;
  final File? video;
  final String? linkUrl;
  final List<String> pollOptions;
  final Function(String) onContentChanged;
  final VoidCallback onImagesAdded;
  final VoidCallback onVideoAdded;
  final Function(String) onLinkChanged;
  final Function(String) onAddPollOption;
  final Function(int) onRemovePollOption;
  final Function(int, String) onUpdatePollOption;

  const PostContentField({
    super.key,
    required this.type,
    required this.content,
    required this.images,
    required this.video,
    required this.linkUrl,
    required this.pollOptions,
    required this.onContentChanged,
    required this.onImagesAdded,
    required this.onVideoAdded,
    required this.onLinkChanged,
    required this.onAddPollOption,
    required this.onRemovePollOption,
    required this.onUpdatePollOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Media upload section for image/video
        if (type == PostType.image || type == PostType.video)
          _buildMediaUploadSection(context),

        // Link input for link type
        if (type == PostType.link)
          TextField(
            decoration: const InputDecoration(
              hintText: '링크 주소를 입력하세요',
              prefixIcon: Icon(Icons.link),
            ),
            onChanged: onLinkChanged,
            controller: TextEditingController(text: linkUrl),
          ),

        // Poll options for poll type
        if (type == PostType.poll)
          PollOptionList(
            options: pollOptions,
            onAdd: onAddPollOption,
            onRemove: onRemovePollOption,
            onUpdate: onUpdatePollOption,
          ),

        const SizedBox(height: 16),

        // Content text field
        _buildContentField(context),
      ],
    );
  }

  Widget _buildMediaUploadSection(BuildContext context) {
    if (type == PostType.image) {
      return Column(
        children: [
          // Image previews
          if (images.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: GestureDetector(
                              onTap: () {
                                // TODO: Implement image removal
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 16),

          // Add image button
          OutlinedButton.icon(
            onPressed: images.length < 10 ? onImagesAdded : null,
            icon: const Icon(Icons.add_photo_alternate),
            label: const Text('이미지 추가'),
          ),
        ],
      );
    }

    if (type == PostType.video) {
      return Column(
        children: [
          if (video != null)
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _VideoPreview(video: video!),
              ),
            )
          else
            OutlinedButton.icon(
              onPressed: onVideoAdded,
              icon: const Icon(Icons.videocam),
              label: const Text('비디오 선택'),
            ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildContentField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: _getContentHint(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      maxLines: type == PostType.text ? null : 3,
      minLines: type == PostType.text ? 5 : 1,
      onChanged: onContentChanged,
      controller: TextEditingController(text: content),
    );
  }

  String _getContentHint() {
    switch (type) {
      case PostType.text:
        return '내용을 입력하세요';
      case PostType.image:
        return '이미지에 대한 설명을 입력하세요 (선택사항)';
      case PostType.video:
        return '비디오에 대한 설명을 입력하세요 (선택사항)';
      case PostType.link:
        return '링크에 대한 설명을 입력하세요 (선택사항)';
      case PostType.poll:
        return '투표에 대한 설명을 입력하세요 (선택사항)';
    }
  }
}

class _VideoPreview extends StatefulWidget {
  final File video;

  const _VideoPreview({required this.video});

  @override
  State<_VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<_VideoPreview> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.video)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        IconButton(
          icon: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            size: 48,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
        ),
      ],
    );
  }
}
