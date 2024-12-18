import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/theme_config.dart';

class HomeDrawer extends ConsumerStatefulWidget {
  const HomeDrawer({super.key});

  @override
  ConsumerState<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends ConsumerState<HomeDrawer> {
  bool _isRecentExpanded = false;
  bool _isMyMusExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildSection(
                    icon: Icons.history,
                    title: '최근 방문 뮤',
                    isExpanded: _isRecentExpanded,
                    onExpand: () => setState(() {
                      _isRecentExpanded = !_isRecentExpanded;
                    }),
                    items: const [], // TODO: Add recent mus
                  ),
                  _buildSection(
                    icon: Icons.favorite_outline,
                    title: '나의 뮤',
                    isExpanded: _isMyMusExpanded,
                    onExpand: () => setState(() {
                      _isMyMusExpanded = !_isMyMusExpanded;
                    }),
                    items: const [], // TODO: Add my mus
                  ),
                  _buildSection(
                    icon: Icons.explore_outlined,
                    title: '모든 뮤',
                    items: const [], // TODO: Add all mus
                  ),
                ],
              ),
            ),
            // Footer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildFooterLink('이용약관'),
                  const SizedBox(height: 8),
                  _buildFooterLink('개인정보처리방침'),
                  const SizedBox(height: 8),
                  const Text('Copyright 2024. Commune All Rights Reserved.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    bool isExpanded = false,
    VoidCallback? onExpand,
    required List<Widget> items,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: ThemeConfig.primaryColor),
          title: Text(title),
          trailing: onExpand != null
              ? Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                )
              : null,
          onTap: onExpand,
        ),
        if (isExpanded && items.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('아직 뮤가 없습니다'),
          ),
        if (isExpanded) ...items,
        const Divider(),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to respective page
      },
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          fontSize: 12,
        ),
      ),
    );
  }
}
