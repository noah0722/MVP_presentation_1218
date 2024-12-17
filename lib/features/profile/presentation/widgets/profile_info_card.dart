import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/profile_model.dart';
import '../../providers/profile_provider.dart';

class ProfileInfoCard extends ConsumerStatefulWidget {
  final Profile profile;

  const ProfileInfoCard({
    super.key,
    required this.profile,
  });

  @override
  ConsumerState<ProfileInfoCard> createState() => _ProfileInfoCardState();
}

class _ProfileInfoCardState extends ConsumerState<ProfileInfoCard> {
  final _nameController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.profile.displayName;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileNotifierProvider);

    ref.listen<ProfileState>(profileNotifierProvider, (previous, next) {
      if (previous?.error != next.error && next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person_outline),
                const SizedBox(width: 8),
                const Text(
                  '프로필',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.profile.isAdmin) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '관리자',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),

            // Display Name
            Row(
              children: [
                Expanded(
                  child: _isEditing
                      ? TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: '닉네임',
                          ),
                          enabled: !state.isLoading,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '닉네임',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              widget.profile.displayName,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                ),
                const SizedBox(width: 8),
                if (!state.isLoading)
                  TextButton(
                    onPressed: () async {
                      if (_isEditing) {
                        final success = await ref
                            .read(profileNotifierProvider.notifier)
                            .updateDisplayName(_nameController.text);
                        if (success) {
                          setState(() => _isEditing = false);
                        }
                      } else {
                        setState(() => _isEditing = true);
                      }
                    },
                    child: Text(_isEditing ? '확인' : '수정'),
                  ),
                if (_isEditing)
                  TextButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            _nameController.text = widget.profile.displayName;
                            setState(() => _isEditing = false);
                          },
                    child: const Text('취소'),
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '이메일',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.profile.email,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
