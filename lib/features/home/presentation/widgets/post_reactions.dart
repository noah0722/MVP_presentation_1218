import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../../../../core/config/theme_config.dart';

class PostReactions extends StatelessWidget {
  final Post post;

  const PostReactions({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          // Thumbs up
          _ReactionButton(
            icon: Icons.thumb_up_outlined,
            filledIcon: Icons.thumb_up,
            count: post.thumbsUp,
            isSelected: post.isUserThumbUp,
            onPressed: () {
              // TODO: Implement thumb up
            },
          ),

          // Total thumbs count
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              post.totalThumbs.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: post.totalThumbs > 0
                        ? ThemeConfig.successColor
                        : post.totalThumbs < 0
                            ? ThemeConfig.errorColor
                            : Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                  ),
            ),
          ),

          // Thumbs down
          _ReactionButton(
            icon: Icons.thumb_down_outlined,
            filledIcon: Icons.thumb_down,
            count: post.thumbsDown,
            isSelected: post.isUserThumbDown,
            onPressed: () {
              // TODO: Implement thumb down
            },
          ),

          const SizedBox(width: 16),

          // Comments
          _ReactionButton(
            icon: Icons.chat_bubble_outline,
            count: post.commentCount,
            onPressed: () {
              // TODO: Navigate to post detail with comments focused
            },
          ),

          const Spacer(),

          // Share
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              _showShareBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      '공유하기',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ShareOption(
                    icon: Icons.chat,
                    label: '카카오톡 공유',
                    onTap: () {
                      // TODO: Implement KakaoTalk share
                      Navigator.pop(context);
                    },
                  ),
                  _ShareOption(
                    icon: Icons.repeat,
                    label: '코뮌 내 공유',
                    onTap: () {
                      // TODO: Navigate to share post page
                      Navigator.pop(context);
                    },
                  ),
                  _ShareOption(
                    icon: Icons.link,
                    label: '링크 복사',
                    onTap: () {
                      // TODO: Implement link copy
                      Navigator.pop(context);
                    },
                  ),
                  _ShareOption(
                    icon: Icons.bookmark_border,
                    label: '저장',
                    onTap: () {
                      // TODO: Implement save post
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _ReactionButton extends StatelessWidget {
  final IconData icon;
  final IconData? filledIcon;
  final int count;
  final bool isSelected;
  final VoidCallback onPressed;

  const _ReactionButton({
    required this.icon,
    this.filledIcon,
    required this.count,
    this.isSelected = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          children: [
            Icon(
              isSelected ? (filledIcon ?? icon) : icon,
              size: 20,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 4),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShareOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
