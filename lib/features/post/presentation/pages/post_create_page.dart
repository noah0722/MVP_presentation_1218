// lib/features/post/presentation/pages/post_write_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/post_create_provider.dart';
import '../widgets/post_type_selector.dart';
import '../widgets/post_content_field.dart';
import '../widgets/mu_selector.dart';
import '../../../../core/config/theme_config.dart';

class PostCreatePage extends ConsumerStatefulWidget {
  const PostCreatePage({super.key});

  @override
  ConsumerState<PostCreatePage> createState() => _PostCreatePageState();
}

class _PostCreatePageState extends ConsumerState<PostCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postCreateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('포스트 작성'),
        actions: [
          TextButton(
            onPressed: state.isValid && !state.isLoading
                ? () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      final success = await ref
                          .read(postCreateProvider.notifier)
                          .createPost(
                              _titleController.text, _contentController.text);
                      if (success && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('포스트가 작성되었습니다')),
                        );
                        Navigator.pop(context);
                      }
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const MuSelector(),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: '제목',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '제목을 입력해주세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const PostTypeSelector(),
            const SizedBox(height: 16),
            PostContentField(
              type: state.type,
              content: _contentController.text,
              images: state.images,
              video: state.video,
              linkUrl: state.linkUrl,
              pollOptions: state.pollOptions,
              onContentChanged: (value) => _contentController.text = value,
              onImagesAdded: () async {
                final ImagePicker picker = ImagePicker();
                final images = await picker.pickMultiImage();
                ref.read(postCreateProvider.notifier).addImages(images);
              },
              onVideoAdded: () async {
                final ImagePicker picker = ImagePicker();
                final video =
                    await picker.pickVideo(source: ImageSource.gallery);
                if (video != null) {
                  ref.read(postCreateProvider.notifier).setVideo(video);
                }
              },
              onLinkChanged: (value) {
                ref.read(postCreateProvider.notifier).setLinkUrl(value);
              },
              onAddPollOption: (value) {
                ref.read(postCreateProvider.notifier).addPollOption(value);
              },
              onRemovePollOption: (index) {
                ref.read(postCreateProvider.notifier).removePollOption(index);
              },
              onUpdatePollOption: (index, value) {
                ref
                    .read(postCreateProvider.notifier)
                    .updatePollOption(index, value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
