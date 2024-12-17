import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/mu_provider.dart';
import '../widgets/mu_banner.dart';
import '../widgets/mu_discussion_tab.dart';
import '../widgets/mu_info_tab.dart';
import '../widgets/mu_official_tab.dart';
import '../../../../core/config/theme_config.dart';

final muSelectedTabProvider = StateProvider<int>((ref) => 0);

class MuDetailPage extends ConsumerWidget {
  final String muId;

  const MuDetailPage({
    super.key,
    required this.muId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final muAsync = ref.watch(muProvider(muId));
    final selectedTab = ref.watch(muSelectedTabProvider);

    // Record visit
    ref.listen(muProvider(muId), (previous, next) {
      if (previous?.value != next.value && next.hasValue) {
        ref.read(muManagementProvider.notifier).recordVisit(muId);
      }
    });

    return Scaffold(
      body: muAsync.when(
        data: (mu) => DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // Mu Banner with Profile
                SliverToBoxAdapter(
                  child: MuBanner(mu: mu),
                ),

                // Tab Bar
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      onTap: (index) {
                        ref.read(muSelectedTabProvider.notifier).state = index;
                      },
                      labelColor: ThemeConfig.primaryColor,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.onSurface,
                      indicatorColor: ThemeConfig.primaryColor,
                      tabs: const [
                        Tab(text: '토론'),
                        Tab(text: '정보'),
                        Tab(text: '공식'),
                      ],
                    ),
                  ),
                ),
              ];
            },
            // Tab content
            body: IndexedStack(
              index: selectedTab,
              children: [
                MuDiscussionTab(
                  mu: mu,
                  muId: '',
                  sortType: '',
                ),
                MuInfoTab(mu: mu),
                const MuOfficialTab(),
              ],
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => const Center(
          child: Text('뮤를 불러오는데 실패했습니다'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to post write page with pre-selected mu
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
