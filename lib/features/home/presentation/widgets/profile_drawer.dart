import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/firebase_service.dart';
import '../../../../core/config/theme_config.dart';
import '../../../../core/constants/app_constants.dart';

class ProfileDrawer extends ConsumerStatefulWidget {
  const ProfileDrawer({super.key});

  @override
  ConsumerState<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends ConsumerState<ProfileDrawer> {
  bool _isOfficialExpanded = false;

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(firebaseServiceProvider).currentUser;
    final isAdmin = currentUser?.email == AppConstants.adminEmail;

    if (currentUser == null) {
      return Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '로그인하기',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Navigate to login page
                },
              ),
            ],
          ),
        ),
      );
    }

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  // User info
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser.displayName ?? '닉네임 없음',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          currentUser.email ?? '',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.6),
                                  ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),

                  // Profile menu items
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text('나의 정보'),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to profile info page
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.star_outline),
                    title: const Text('나의 코몰'),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to commore page
                    },
                  ),

                  ListTile(
                    leading: const Icon(Icons.article_outlined),
                    title: const Text('나의 포스트'),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to my posts page
                    },
                  ),

                  // Official Mu Registration
                  ListTile(
                    leading: const Icon(Icons.verified_outlined),
                    title: const Text('공식 뮤 등록하기'),
                    trailing: Icon(
                      _isOfficialExpanded
                          ? Icons.expand_less
                          : Icons.expand_more,
                    ),
                    onTap: () {
                      setState(() {
                        _isOfficialExpanded = !_isOfficialExpanded;
                      });
                    },
                  ),

                  if (_isOfficialExpanded)
                    Column(
                      children: [
                        _buildSubMenuItem('정치인'),
                        _buildSubMenuItem('정당'),
                        _buildSubMenuItem('미디어'),
                        _buildSubMenuItem('여론조사 업체'),
                        _buildSubMenuItem('공직 선거 후보 (서비스 준비 중)',
                            enabled: false),
                      ],
                    ),

                  ListTile(
                    leading: const Icon(Icons.campaign_outlined),
                    title: const Text('광고하기'),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Navigate to advertising page
                    },
                  ),

                  // Admin Mode (only for admin)
                  if (isAdmin)
                    ListTile(
                      leading: const Icon(Icons.admin_panel_settings_outlined),
                      title: const Text('운영자 모드'),
                      onTap: () {
                        Navigator.pop(context);
                        // TODO: Navigate to admin page
                      },
                    ),
                ],
              ),
            ),

            // Logout button
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await ref.read(firebaseServiceProvider).signOut();
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('로그아웃'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubMenuItem(String title, {bool enabled = true}) {
    return ListTile(
      enabled: enabled,
      contentPadding: const EdgeInsets.only(left: 56, right: 16),
      title: Text(
        title,
        style: TextStyle(
          color: enabled
              ? null
              : Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
        ),
      ),
      onTap: enabled
          ? () {
              Navigator.pop(context);
              // TODO: Navigate to specific registration page
            }
          : null,
      dense: true,
    );
  }
}
