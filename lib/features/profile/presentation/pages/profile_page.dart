import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/profile_provider.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_stats_card.dart';
import '../widgets/profile_actions_card.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentProfileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('나의 정보'),
      ),
      body: profileAsync.when(
        data: (profile) {
          if (profile == null) {
            return const Center(
              child: Text('로그인이 필요합니다'),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ProfileInfoCard(profile: profile),
              const SizedBox(height: 16),
              ProfileStatsCard(profile: profile),
              const SizedBox(height: 16),
              ProfileActionsCard(profile: profile),
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (_, __) => const Center(
          child: Text('프로필을 불러오는데 실패했습니다'),
        ),
      ),
    );
  }
}
