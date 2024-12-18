// lib/features/post/presentation/widgets/post_type_selector.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/post_create_provider.dart';

class PostTypeSelector extends ConsumerWidget {
  const PostTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentType = ref.watch(postCreateProvider).type;

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: PostType.values.map((type) {
          return _TypeOption(
            type: type,
            isSelected: type == currentType,
            onTap: () => ref.read(postCreateProvider.notifier).setType(type),
          );
        }).toList(),
      ),
    );
  }
}

class _TypeOption extends StatelessWidget {
  final PostType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _TypeOption({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Icon(
            _getIcon(type),
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ),
    );
  }

  IconData _getIcon(PostType type) {
    switch (type) {
      case PostType.text:
        return Icons.text_fields;
      case PostType.image:
        return Icons.image;
      case PostType.video:
        return Icons.videocam;
      case PostType.link:
        return Icons.link;
      case PostType.poll:
        return Icons.poll;
    }
  }
}
