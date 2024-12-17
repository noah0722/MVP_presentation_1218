import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/home_provider.dart';
import '../../../../core/config/theme_config.dart';

class FeedFilters extends ConsumerWidget {
  const FeedFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Column(
      children: [
        // Feed type tabs
        SizedBox(
          height: 48,
          child: Row(
            children: FeedType.values.map((type) {
              final isSelected = state.feedType == type;
              return Expanded(
                child: InkWell(
                  onTap: () =>
                      ref.read(homeProvider.notifier).setFeedType(type),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _getFeedTypeLabel(type),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected
                              ? ThemeConfig.primaryColor
                              : ThemeConfig.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: isSelected
                            ? ThemeConfig.primaryColor
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        // Filter options
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Post type filter
              Expanded(
                child: DropdownButtonFormField<PostFilter>(
                  value: state.postFilter,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  items: PostFilter.values.map((filter) {
                    return DropdownMenuItem(
                      value: filter,
                      child: Text(_getPostFilterLabel(filter)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(homeProvider.notifier).setPostFilter(value);
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              // Mu type filter
              Expanded(
                child: DropdownButtonFormField<MuFilter>(
                  value: state.muFilter,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  items: MuFilter.values.map((filter) {
                    return DropdownMenuItem(
                      value: filter,
                      child: Text(_getMuFilterLabel(filter)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(homeProvider.notifier).setMuFilter(value);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getFeedTypeLabel(FeedType type) {
    switch (type) {
      case FeedType.best:
        return '베스트';
      case FeedType.recent:
        return '최신';
      case FeedType.following:
        return '팔로잉';
    }
  }

  String _getPostFilterLabel(PostFilter filter) {
    switch (filter) {
      case PostFilter.all:
        return '포스트 종류: 전체';
      case PostFilter.discussion:
        return '포스트 종류: 토론';
      case PostFilter.official:
        return '포스트 종류: 공식';
    }
  }

  String _getMuFilterLabel(MuFilter filter) {
    switch (filter) {
      case MuFilter.all:
        return '뮤 종류: 전체';
      case MuFilter.politicsParty:
        return '뮤 종류: 정치인 & 정당';
      case MuFilter.newsPolls:
        return '뮤 종류: 뉴스 & 여론조사';
      case MuFilter.election:
        return '뮤 종류: 선거';
    }
  }
}
