import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/post_create_provider.dart';
import '../../../mu/models/mu_model.dart';
import '../../../mu/providers/mu_provider.dart';

class MuSelector extends ConsumerStatefulWidget {
  const MuSelector({super.key});

  @override
  ConsumerState<MuSelector> createState() => _MuSelectorState();
}

class _MuSelectorState extends ConsumerState<MuSelector> {
  final TextEditingController _searchController = TextEditingController();
  bool _isExpanded = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedMuId = ref.watch(postCreateProvider).selectedMuId;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Selected Mu display / selector button
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
              if (!_isExpanded) {
                _searchController.clear();
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: selectedMuId != null
                      ? _buildSelectedMu(selectedMuId)
                      : Text(
                          '뮤 선택',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                        ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            ),
          ),
        ),

        // Mu selection panel
        if (_isExpanded) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search field
                TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: '뮤 검색',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 16),

                // Recent Mus
                _buildMuSection(
                  title: '최근 방문 뮤',
                  items: _filterMus(ref.watch(recentMusProvider)),
                ),

                // My Mus
                _buildMuSection(
                  title: '나의 뮤',
                  items: _filterMus(ref.watch(myMusProvider)),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSelectedMu(String muId) {
    return ref.watch(muProvider(muId)).when(
          data: (mu) => Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: NetworkImage(mu.profileImageUrl),
              ),
              const SizedBox(width: 8),
              Text('mu/${mu.name}'),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (_, __) => const Text('Error loading mu'),
        );
  }

  Widget _buildMuSection({
    required String title,
    required List<Mu> items,
  }) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '뮤가 없습니다',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          ...items.map((mu) => _buildMuItem(mu)),
        ],
      ),
    );
  }

  Widget _buildMuItem(Mu mu) {
    final isSelected = ref.watch(postCreateProvider).selectedMuId == mu.id;

    return InkWell(
      onTap: () {
        ref.read(postCreateProvider.notifier).setMu(mu.id);
        setState(() {
          _isExpanded = false;
          _searchController.clear();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(mu.profileImageUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'mu/${mu.name}',
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : null,
                  color:
                      isSelected ? Theme.of(context).colorScheme.primary : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Mu> _filterMus(AsyncValue<List<Mu>> musValue) {
    return musValue.when(
      data: (mus) {
        if (_searchController.text.isEmpty) return mus;
        final query = _searchController.text.toLowerCase();
        return mus
            .where((mu) => mu.name.toLowerCase().contains(query))
            .toList();
      },
      loading: () => [],
      error: (_, __) => [],
    );
  }
}
