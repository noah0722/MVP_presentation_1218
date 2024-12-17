import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/theme_config.dart';
import '../../../mu/models/mu_model.dart';

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
                  // Recent Mus
                  _buildMuSection(
                    icon: Icons.history,
                    title: '최근 방문 뮤',
                    isExpanded: _isRecentExpanded,
                    onExpandTap: () {
                      setState(() {
                        _isRecentExpanded = !_isRecentExpanded;
                      });
                    },
                    isEmpty: true, // TODO: Replace with actual data check
                    emptyMessage: '새로운 뮤를 찾아보세요',
                    onEmptyTap: () {
                      // TODO: Navigate to Mu main page
                    },
                    items: [], // TODO: Replace with actual recent mus
                  ),

                  // My Mus
                  _buildMuSection(
                    icon: Icons.favorite,
                    title: '나의 뮤',
                    isExpanded: _isMyMusExpanded,
                    onExpandTap: () {
                      setState(() {
                        _isMyMusExpanded = !_isMyMusExpanded;
                      });
                    },
                    isEmpty: true, // TODO: Replace with actual data check
                    emptyMessage: '뮤에 가입해보세요',
                    onEmptyTap: () {
                      // TODO: Navigate to Mu main page
                    },
                    items: [], // TODO: Replace with actual joined mus
                  ),

                  // All Mus
                  _buildMuSection(
                    icon: Icons.explore,
                    title: '모든 뮤',
                    items: [], // TODO: Replace with random mus
                    showMoreText: '더 보기',
                    onMoreTap: () {
                      // TODO: Navigate to Mu main page
                    },
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // TODO: Navigate to Terms page
                    },
                    child: Text(
                      '이용약관>',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      // TODO: Navigate to Privacy Policy page
                    },
                    child: Text(
                      '개인정보처리방침>',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Copyright 2024. Commune All Rights Reserved.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMuSection({
    required IconData icon,
    required String title,
    bool isExpanded = false,
    VoidCallback? onExpandTap,
    bool isEmpty = false,
    String? emptyMessage,
    VoidCallback? onEmptyTap,
    required List<Mu> items,
    String? showMoreText,
    VoidCallback? onMoreTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: onExpandTap != null
              ? IconButton(
                  icon: Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                  onPressed: onExpandTap,
                )
              : null,
        ),

        // Empty state
        if (isEmpty && emptyMessage != null)
          InkWell(
            onTap: onEmptyTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                emptyMessage,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
              ),
            ),
          ),

        // Mu items
        if (!isEmpty) ...[
          ...items.take(isExpanded ? items.length : 3).map((mu) => _MuListItem(
                mu: mu,
                onTap: () {
                  // TODO: Navigate to mu detail
                },
                onJoinTap: () {
                  // TODO: Implement join mu
                },
              )),
          if (showMoreText != null && !isExpanded && items.length > 3)
            InkWell(
              onTap: onMoreTap,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  showMoreText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],

        const Divider(),
      ],
    );
  }
}

class _MuListItem extends StatelessWidget {
  final Mu mu;
  final VoidCallback onTap;
  final VoidCallback onJoinTap;

  const _MuListItem({
    required this.mu,
    required this.onTap,
    required this.onJoinTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            // Mu profile image
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(mu.profileImageUrl),
            ),
            const SizedBox(width: 12),
            // Mu name
            Expanded(
              child: Text(
                'mu/${mu.name}',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Join button
            ElevatedButton(
              onPressed: onJoinTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeConfig.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                minimumSize: const Size(60, 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                '가입',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
