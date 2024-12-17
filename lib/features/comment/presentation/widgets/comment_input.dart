import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/comment_provider.dart';

class CommentInput extends ConsumerStatefulWidget {
  final String postId;

  const CommentInput({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends ConsumerState<CommentInput> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // TODO: Check login status
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentProvider);

    ref.listen<CommentState>(commentProvider, (previous, next) {
      if (previous?.error != next.error && next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reply to indicator
          if (state.replyTo != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  const Icon(Icons.reply, size: 16),
                  const SizedBox(width: 4),
                  const Text('답글 작성 중'),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    onPressed: () {
                      ref.read(commentProvider.notifier).setReplyTo(null);
                    },
                  ),
                ],
              ),
            ),

          // Input field and submit button
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    hintText: '댓글을 입력하세요',
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                  onChanged: (value) {
                    ref.read(commentProvider.notifier).setContent(value);
                  },
                ),
              ),
              IconButton(
                icon: state.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.send),
                onPressed: state.isLoading
                    ? null
                    : () async {
                        final success = await ref
                            .read(commentProvider.notifier)
                            .createComment(widget.postId);

                        if (success) {
                          _controller.clear();
                          if (mounted) {
                            FocusScope.of(context).unfocus();
                          }
                        }
                      },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
