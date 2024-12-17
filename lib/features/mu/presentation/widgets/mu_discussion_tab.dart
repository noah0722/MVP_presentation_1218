import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/mu_model.dart';
import '../../../post/providers/post_create_provider.dart';
import '../../../home/presentation/widgets/feed_list.dart';

final muDiscussionSortProvider = StateProvider<String>((ref) => 'best');

class MuDiscussionTab extends ConsumerWidget {
  final Mu mu;
  final String muId;
  final String sortType;

  const MuDiscussionTab({
    super.key,
    required this.mu,
    required this.muId,
    required this.sortType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = ref.watch(muDiscussionSortProvider);

    return Column(
      children: [
        const SizedBox(height: 100), // Space for mu banner overlap

        // Sort options
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _SortOption(
                label: '베스트',
                value: 'best',
                currentValue: sortType,
              ),
              const SizedBox(width: 16),
              _SortOption(
                label: '최신',
                value: 'recent',
                currentValue: sortType,
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),
        const Divider(height: 1),

        // Posts
        Expanded(
          child: FeedList(
            muId: muId,
            sortType: sortType,
          ),
        ),
      ],
    );
  }
}

class _SortOption extends ConsumerWidget {
  final String label;
  final String value;
  final String currentValue;

  const _SortOption({
    required this.label,
    required this.value,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = value == currentValue;

    return GestureDetector(
      onTap: () {
        ref.read(muDiscussionSortProvider.notifier).state = value;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
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
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
