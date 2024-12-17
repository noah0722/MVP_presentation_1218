import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/comment_model.dart';
import '../../providers/comment_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentItem extends ConsumerWidget {
  final Comment comment;
  final int level;
  final VoidCallback onReply;

  const CommentItem({
    super.key,
    required this.comment,
    required this.level,
    required this.onReply,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0 * level,
        right: 16.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author and time
          Row(
            children: [
              Text(
                comment.authorName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: 8),
              Text(
                _getTimeAgo(comment.createdAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Content
          Text(comment.content),
          const SizedBox(height: 8),

          // Actions
          Row(
            children: [
              // Thumbs up
              _ReactionButton(
                icon: Icons.thumb_up_outlined,
                filledIcon: Icons.thumb_up,
                count: comment.thumbsUp,
                isSelected: comment.isUserThumbUp,
                onPressed: () {
                  ref
                      .read(commentProvider.notifier)
                      .reactToComment(comment.id, true);
                },
              ),

              // Total thumbs count
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  (comment.thumbsUp - comment.thumbsDown).toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: (comment.thumbsUp - comment.thumbsDown) > 0
                            ? Theme.of(context).colorScheme.primary
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
                count: comment.thumbsDown,
                isSelected: comment.isUserThumbDown,
                onPressed: () {
                  ref
                      .read(commentProvider.notifier)
                      .reactToComment(comment.id, false);
                },
              ),

              const SizedBox(width: 16),

              // Reply button
              if (level < 4)
                TextButton(
                  onPressed: () {
                    ref.read(commentProvider.notifier).setReplyTo(comment.id);
                    onReply();
                  },
                  child: const Text('답글'),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays >= 334) {
      // ~11 months
      return '${difference.inDays ~/ 334}년 전';
    } else if (difference.inDays >= 30) {
      return '${difference.inDays ~/ 30}달 전';
    } else if (difference.inDays >= 8) {
      return '${difference.inDays ~/ 7}주 전';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}일 전';
    } else {
      return '${difference.inHours}시간 전';
    }
  }
}

class _ReactionButton extends StatelessWidget {
  final IconData icon;
  final IconData filledIcon;
  final int count;
  final bool isSelected;
  final VoidCallback onPressed;

  const _ReactionButton({
    required this.icon,
    required this.filledIcon,
    required this.count,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Icon(
              isSelected ? filledIcon : icon,
              size: 16,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 4),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
