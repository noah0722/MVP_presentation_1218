import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../models/post_model.dart';
import 'post_poll.dart';
import 'post_link_preview.dart';

class PostContent extends StatefulWidget {
  final Post post;

  const PostContent({
    super.key,
    required this.post,
  });

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.post.type == 'video' && widget.post.videoUrl != null) {
      _initializeVideo();
    }
  }

  Future<void> _initializeVideo() async {
    _videoPlayerController =
        VideoPlayerController.network(widget.post.videoUrl!);
    await _videoPlayerController!.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      looping: false,
      autoInitialize: true,
      showControls: true,
      aspectRatio: _videoPlayerController!.value.aspectRatio,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Content based on type
          _buildContent(),

          // Text content if available
          if (widget.post.content.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                widget.post.content,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: widget.post.type == 'text' ? null : 1,
                overflow:
                    widget.post.type == 'text' ? null : TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (widget.post.type) {
      case 'image':
        return _buildImageContent();
      case 'video':
        return _buildVideoContent();
      case 'link':
        return PostLinkPreview(
          url: widget.post.linkUrl!,
          preview: widget.post.linkPreview,
        );
      case 'poll':
        return PostPoll(pollData: widget.post.pollData!);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildImageContent() {
    if (widget.post.images == null || widget.post.images!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        // Image page view
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            itemCount: widget.post.images!.length,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.post.images![index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error_outline),
                ),
              );
            },
          ),
        ),

        // Image indicators
        if (widget.post.images!.length > 1)
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.post.images!.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildVideoContent() {
    if (_chewieController == null ||
        widget.post.videoUrl == null ||
        !_videoPlayerController!.value.isInitialized) {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return AspectRatio(
      aspectRatio: _videoPlayerController!.value.aspectRatio,
      child: Chewie(controller: _chewieController!),
    );
  }
}
