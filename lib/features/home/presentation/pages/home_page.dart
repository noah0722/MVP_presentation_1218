import 'package:commune/features/home/presentation/widgets/feed_filters.dart';
import 'package:commune/features/home/presentation/widgets/profile_drawer.dart';
import 'package:commune/features/post/presentation/pages/post_create_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/feed_appbar.dart';
import '../widgets/feed_list.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_drawer.dart';
import '../../post/presentation/pages/post_create_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: FeedAppBar(
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: const HomeDrawer(), // Left drawer
      endDrawer: const ProfileDrawer(),
      body: Column(
        children: [
          const FeedFilters(), // Add filters
          Expanded(child: _buildBody()),
        ],
      ),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 2) {
            // Post Write index
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PostCreatePage()),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const FeedList(
          muId: '',
          sortType: '',
        );
      case 1:
        return const Center(child: Text('뮤 페이지')); // Mu Page placeholder
      case 3:
        return const Center(child: Text('랭킹 페이지')); // Ranking Page placeholder
      case 4:
        return const Center(
            child: Text('알림 페이지')); // Notification Page placeholder
      default:
        return const FeedList(
          muId: '',
          sortType: '',
        );
    }
  }
}
