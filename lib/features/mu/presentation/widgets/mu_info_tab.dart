import 'package:flutter/material.dart';
import '../../models/mu_model.dart';

class MuInfoTab extends StatelessWidget {
  final Mu mu;

  const MuInfoTab({
    super.key,
    required this.mu,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 84), // Space for mu banner overlap

          // General Info Section
          _buildSection(
            context,
            title: '일반 정보',
            children: [
              _buildInfoRow(
                context,
                label: '카테고리',
                value: '${mu.topicLevel1} > ${mu.topicLevel2}',
              ),
              _buildInfoRow(
                context,
                label: '국가',
                value: mu.country,
              ),
              _buildInfoRow(
                context,
                label: '언어',
                value: mu.language,
              ),
              _buildInfoRow(
                context,
                label: '생성일',
                value: _formatDate(mu.createdAt),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Stats Section
          _buildSection(
            context,
            title: '통계',
            children: [
              _buildInfoRow(
                context,
                label: '가입자 수',
                value: '${mu.memberCount}명',
              ),
              _buildInfoRow(
                context,
                label: '게시글 수',
                value: '${mu.postCount}개',
              ),
            ],
          ),

          if (mu.isOfficial) ...[
            const SizedBox(height: 24),

            // Official Info Section
            _buildSection(
              context,
              title: '공식 정보',
              children: [
                if (mu.officialType != null)
                  _buildInfoRow(
                    context,
                    label: '계정 유형',
                    value: mu.officialType!,
                  ),
                _buildInfoRow(
                  context,
                  label: '인증 상태',
                  value: mu.isVerified ? '인증됨' : '인증 대기중',
                  valueColor: mu.isVerified
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}년 ${date.month}월 ${date.day}일';
  }
}
