import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/post_create_provider.dart';
import '../widgets/mu_selector.dart';
import '../widgets/post_type_selector.dart';
import '../widgets/post_content_field.dart';

class PostCreatePage extends ConsumerWidget {
  const PostCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postCreateProvider);
    final notifier = ref.read(postCreateProvider.notifier);

    ref.listen<PostCreateState>(postCreateProvider, (previous, next) {
      if (previous?.error != next.error && next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Theme.of(context).colorScheme.error,
            showCloseIcon: true,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('포스트 작성'),
        actions: [
          TextButton(
            onPressed: state.isValid && !state.isLoading
                ? () async {
                    final success = await notifier.createPost();
                    if (success && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('포스트가 작성되었습니다'),
                          showCloseIcon: true,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  }
                : null,
            child: state.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('작성'),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Mu selector
                const MuSelector(),
                const SizedBox(height: 16),

                // Title input
                TextField(
                  decoration: const InputDecoration(
                    hintText: '제목',
                  ),
                  onChanged: notifier.setTitle,
                  maxLines: 1,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),

                // Post type selector
                const PostTypeSelector(),
                const SizedBox(height: 16),

                // Content field based on type
                PostContentField(
                  type: state.type,
                  content: state.content,
                  images: state.images,
                  video: state.video,
                  linkUrl: state.linkUrl,
                  pollOptions: state.pollOptions,
                  onContentChanged: notifier.setContent,
                  onImagesAdded: notifier.pickImages,
                  onVideoAdded: notifier.pickVideo,
                  onLinkChanged: notifier.setLinkUrl,
                  onAddPollOption: notifier.addPollOption,
                  onRemovePollOption: notifier.removePollOption,
                  onUpdatePollOption: notifier.updatePollOption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
