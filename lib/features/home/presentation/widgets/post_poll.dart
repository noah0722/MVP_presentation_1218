import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/theme_config.dart';

final userPollVotesProvider =
    StateProvider.family<int?, String>((ref, pollId) => null);

class PostPoll extends ConsumerWidget {
  final Map<String, dynamic> pollData;

  const PostPoll({
    super.key,
    required this.pollData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollId = pollData['id'] as String;
    final options = (pollData['options'] as List).cast<Map<String, dynamic>>();
    final totalVotes = options.fold<int>(
      0,
      (sum, option) => sum + (option['votes'] as int),
    );
    final userVote = ref.watch(userPollVotesProvider(pollId));

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poll options
          ...options.map((option) {
            final optionId = option['id'] as String;
            final optionText = option['text'] as String;
            final votes = option['votes'] as int;
            final percentage =
                totalVotes > 0 ? (votes / totalVotes * 100) : 0.0;
            final isSelected = userVote == options.indexOf(option);

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                onTap: userVote == null
                    ? () {
                        // TODO: Implement vote functionality
                        ref.read(userPollVotesProvider(pollId).notifier).state =
                            options.indexOf(option);
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isSelected
                        ? ThemeConfig.primaryColor.withOpacity(0.1)
                        : Theme.of(context).colorScheme.surface,
                  ),
                  child: Stack(
                    children: [
                      // Progress indicator
                      if (userVote != null)
                        FractionallySizedBox(
                          widthFactor: percentage / 100,
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ThemeConfig.primaryColor.withOpacity(0.1),
                            ),
                          ),
                        ),

                      // Option content
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                optionText,
                                style: TextStyle(
                                  color: isSelected
                                      ? ThemeConfig.primaryColor
                                      : Theme.of(context).colorScheme.onSurface,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (userVote != null)
                              Text(
                                '${percentage.toStringAsFixed(1)}%',
                                style: TextStyle(
                                  color: isSelected
                                      ? ThemeConfig.primaryColor
                                      : Theme.of(context)
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
              ),
            );
          }).toList(),

          // Total votes
          if (userVote != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                '총 $totalVotes표',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.6),
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
