import 'package:commune/features/comment/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/comment_provider.dart';
import 'comment_item.dart';
import 'comment_input.dart';

class CommentSection extends ConsumerWidget {
  final String postId;

  const CommentSection({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsAsync = ref.watch(commentsProvider(postId));
    final sortType = ref.watch(commentSortTypeProvider);

    return Column(
      children: [
        // Sort options
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                '댓글',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  ref.read(commentSortTypeProvider.notifier).state =
                      sortType == 'best' ? 'recent' : 'best';
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.sort,
                      size: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      sortType == 'best' ? '베스트순' : '최신순',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Comments list
        commentsAsync.when(
          data: (comments) {
            if (comments.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Text('첫 댓글을 작성해보세요!'),
              );
            }

            // Group comments by parent
            final Map<String?, List<dynamic>> groupedComments = {};
            for (final comment in comments) {
              final parentId = comment.parentId;
              if (!groupedComments.containsKey(parentId)) {
                groupedComments[parentId] = [];
              }
              groupedComments[parentId]!.add(comment);
            }

            // Build comment tree
            return ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _buildCommentTree(groupedComments, null, 0),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (_, __) => const Center(
            child: Text('댓글을 불러오는데 실패했습니다'),
          ),
        ),

        // Comment input
        CommentInput(postId: postId),
      ],
    );
  }

  List<Widget> _buildCommentTree(
    Map<String?, List<dynamic>> groupedComments,
    String? parentId,
    int level,
  ) {
    if (!groupedComments.containsKey(parentId) || level >= 5) {
      return [];
    }

    final comments = groupedComments[parentId]!;
    return comments.expand<Widget>((comment) {
      return [
        CommentItem(
          comment: comment,
          level: level,
          onReply: () {},
        ),
      ];
    }).toList();
  }
}
