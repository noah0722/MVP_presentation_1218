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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TypeOption(
            type: PostType.text,
            currentType: currentType,
            icon: Icons.text_fields,
          ),
          _TypeOption(
            type: PostType.image,
            currentType: currentType,
            icon: Icons.image,
          ),
          _TypeOption(
            type: PostType.video,
            currentType: currentType,
            icon: Icons.videocam,
          ),
          _TypeOption(
            type: PostType.link,
            currentType: currentType,
            icon: Icons.link,
          ),
          _TypeOption(
            type: PostType.poll,
            currentType: currentType,
            icon: Icons.poll,
          ),
        ],
      ),
    );
  }
}

class _TypeOption extends ConsumerWidget {
  final PostType type;
  final PostType currentType;
  final IconData icon;

  const _TypeOption({
    required this.type,
    required this.currentType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = type == currentType;

    return Expanded(
      child: InkWell(
        onTap: () {
          ref.read(postCreateProvider.notifier).setType(type);
        },
        child: Container(
          height: double.infinity,
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
            icon,
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
