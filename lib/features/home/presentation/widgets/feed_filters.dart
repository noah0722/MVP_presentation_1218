import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/home_provider.dart';

class FeedFilters extends ConsumerWidget {
  const FeedFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedType = ref.watch(feedTypeProvider);
    final postFilter = ref.watch(postFilterProvider);
    final muFilter = ref.watch(muFilterProvider);

    return Column(
      children: [
        // Feed type tabs
        SizedBox(
          height: 48,
          child: Row(
            children: [
              _buildTab(context, '베스트', FeedType.best, feedType, ref),
              _buildTab(context, '최신', FeedType.recent, feedType, ref),
              _buildTab(context, '팔로잉', FeedType.following, feedType, ref),
            ],
          ),
        ),
        // Filter rows
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: _buildFilterDropdown(
                  context,
                  '포스트 종류',
                  postFilter,
                  PostFilter.values,
                  (value) =>
                      ref.read(postFilterProvider.notifier).state = value,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildFilterDropdown(
                  context,
                  '뮤 종류',
                  muFilter,
                  MuFilter.values,
                  (value) => ref.read(muFilterProvider.notifier).state = value,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(BuildContext context, String text, FeedType type,
      FeedType currentType, WidgetRef ref) {
    final isSelected = type == currentType;
    return Expanded(
      child: InkWell(
        onTap: () => ref.read(feedTypeProvider.notifier).state = type,
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
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown<T>(
    BuildContext context,
    String hint,
    T value,
    List<T> items,
    Function(T) onChanged,
  ) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(_getFilterLabel(item)),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
    );
  }

  String _getFilterLabel(dynamic filter) {
    if (filter is PostFilter) {
      switch (filter) {
        case PostFilter.all:
          return '전체';
        case PostFilter.discussion:
          return '토론';
        case PostFilter.official:
          return '공식';
      }
    } else if (filter is MuFilter) {
      switch (filter) {
        case MuFilter.all:
          return '전체';
        case MuFilter.politicsParty:
          return '정치인 & 정당';
        case MuFilter.newsPolls:
          return '뉴스 & 여론조사';
        case MuFilter.election:
          return '선거';
      }
    }
    return '';
  }
}
