import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/profile_model.dart';
import '../../providers/profile_provider.dart';

class ProfileActionsCard extends ConsumerWidget {
  final Profile profile;

  const ProfileActionsCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 8),
                Text(
                  '설정',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // My Posts
            ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text('나의 포스트'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to my posts page
              },
            ),

            // My Comments
            ListTile(
              leading: const Icon(Icons.chat_bubble_outline),
              title: const Text('나의 댓글'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to my comments page
              },
            ),

            // Commore History
            ListTile(
              leading: const Icon(Icons.star_outline),
              title: const Text('코몰 내역'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to commore history page
              },
            ),

            // Admin Mode (if admin)
            if (profile.isAdmin)
              ListTile(
                leading: const Icon(Icons.admin_panel_settings_outlined),
                title: const Text('운영자 모드'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Navigate to admin page
                },
              ),

            const Divider(),

            // Delete Account
            ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                '회원 탈퇴',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              onTap: state.isLoading
                  ? null
                  : () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('회원 탈퇴'),
                          content: const Text(
                            '정말로 탈퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('취소'),
                            ),
                            TextButton(
                              onPressed: () async {
                                final success = await ref
                                    .read(profileNotifierProvider.notifier)
                                    .deleteAccount();

                                if (success && context.mounted) {
                                  Navigator.pop(context); // Close dialog
                                  Navigator.pop(
                                      context); // Return to previous page
                                }
                              },
                              child: Text(
                                '탈퇴',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
