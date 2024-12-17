import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/home_provider.dart';
import '../widgets/feed_appbar.dart';
import '../widgets/feed_filters.dart';
import '../widgets/feed_list.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_drawer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Fetch initial posts
    Future.microtask(() => ref.read(homeProvider.notifier).fetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);

    return Scaffold(
      key: _scaffoldKey,
      appBar: FeedAppBar(
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: const HomeDrawer(),
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeProvider.notifier).refreshPosts(),
        child: Column(
          children: [
            const FeedFilters(),
            Expanded(
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.error != null
                      ? Center(child: Text(state.error!))
                      : const FeedList(
                          muId: '',
                          sortType: '',
                        ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNav(),
    );
  }
}
