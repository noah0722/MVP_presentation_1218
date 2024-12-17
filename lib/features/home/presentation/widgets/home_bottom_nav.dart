import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/theme_config.dart';

final selectedNavIndexProvider = StateProvider<int>((ref) => 0);

class HomeBottomNav extends ConsumerWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedNavIndexProvider);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            ref.read(selectedNavIndexProvider.notifier).state = index;

            // TODO: Implement navigation
            switch (index) {
              case 0: // Home
                break;
              case 1: // Mu
                break;
              case 2: // Write
                break;
              case 3: // Ranking
                break;
              case 4: // Notifications
                break;
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedItemColor: ThemeConfig.primaryColor,
          unselectedItemColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 12,
          ),
          items: [
            _buildNavItem(
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: '홈',
            ),
            _buildNavItem(
              icon: Icons.people_outline,
              activeIcon: Icons.people,
              label: '뮤',
            ),
            _buildNavItem(
              icon: Icons.add_circle_outline,
              activeIcon: Icons.add_circle,
              label: '작성하기',
            ),
            _buildNavItem(
              icon: Icons.emoji_events_outlined,
              activeIcon: Icons.emoji_events,
              label: '랭킹',
            ),
            _buildNavItem(
              icon: Icons.notifications_outlined,
              activeIcon: Icons.notifications,
              label: '알림',
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      label: label,
    );
  }
}
