import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/profile_provider.dart';
import '../../models/profile_model.dart';

class CommoreHistoryPage extends ConsumerWidget {
  final String userId;

  const CommoreHistoryPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(commoreTransactionsProvider(userId));
    final profile = ref.watch(profileProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('코몰 내역'),
      ),
      body: Column(
        children: [
          // Total Points Card
          profile.when(
            data: (profile) => Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, size: 32),
                    const SizedBox(width: 8),
                    Column(
                      children: [
                        const Text(
                          '총 코몰',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          profile.commorePoints.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            loading: () => const SizedBox(height: 100),
            error: (_, __) => const SizedBox(height: 100),
          ),

          // Transactions List
          Expanded(
            child: transactions.when(
              data: (transactions) {
                if (transactions.isEmpty) {
                  return const Center(
                    child: Text('아직 코몰 내역이 없습니다'),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: transactions.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return _CommoreTransactionItem(transaction: transaction);
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (_, __) => const Center(
                child: Text('내역을 불러오는데 실패했습니다'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CommoreTransactionItem extends StatelessWidget {
  final CommoreTransaction transaction;

  const _CommoreTransactionItem({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.points > 0;

    return ListTile(
      leading: Icon(
        isPositive ? Icons.add_circle : Icons.remove_circle,
        color: isPositive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.error,
      ),
      title: Text(_getTransactionTitle(transaction.type)),
      subtitle: Text(
        _formatDate(transaction.timestamp),
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Text(
        '${isPositive ? '+' : ''}${transaction.points}',
        style: TextStyle(
          color: isPositive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getTransactionTitle(String type) {
    switch (type) {
      case 'join_mu':
        return '뮤 가입';
      case 'post':
        return '포스트 작성';
      case 'comment':
        return '댓글 작성';
      case 'reply':
        return '답글 작성';
      default:
        return type;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}년 ${date.month}월 ${date.day}일';
  }
}
