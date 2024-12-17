import 'package:flutter/material.dart';
import '../../models/profile_model.dart';

class ProfileStatsCard extends StatelessWidget {
  final Profile profile;

  const ProfileStatsCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.bar_chart),
                SizedBox(width: 8),
                Text(
                  '활동',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  icon: Icons.star,
                  label: '코몰',
                  value: profile.commorePoints.toString(),
                  color: Theme.of(context).colorScheme.primary,
                ),
                _buildStatItem(
                  context,
                  icon: Icons.article,
                  label: '포스트',
                  value: profile.postCount.toString(),
                ),
                _buildStatItem(
                  context,
                  icon: Icons.chat_bubble,
                  label: '댓글',
                  value: profile.commentCount.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    Color? color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: color ?? Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
        ],
      ),
    );
  }
}
