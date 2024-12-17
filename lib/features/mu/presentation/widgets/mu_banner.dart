import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/mu_model.dart';
import '../../providers/mu_provider.dart';
import '../../../../core/config/theme_config.dart';

class MuBanner extends ConsumerWidget {
  final Mu mu;

  const MuBanner({
    super.key,
    required this.mu,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manageState = ref.watch(muManagementProvider);

    return Stack(
      children: [
        // Banner Image
        AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            imageUrl: mu.bannerImageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Theme.of(context).colorScheme.surface,
            ),
            errorWidget: (context, url, error) => Container(
              color: Theme.of(context).colorScheme.surface,
              child: const Icon(Icons.error_outline),
            ),
          ),
        ),

        // Profile and Info
        Positioned(
          left: 16,
          right: 16,
          bottom: -40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Profile Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 4,
                  ),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: mu.profileImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: const Icon(Icons.error_outline),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Mu Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mu Name and Badge
                    Row(
                      children: [
                        Text(
                          'mu/${mu.name}',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        if (mu.isOfficial && mu.officialBadgeUrl != null) ...[
                          const SizedBox(width: 8),
                          CachedNetworkImage(
                            imageUrl: mu.officialBadgeUrl!,
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Description
                    Text(
                      mu.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.6),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Join Button
              Column(
                children: [
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: manageState.isLoading
                        ? null
                        : () async {
                            final success = await ref
                                .read(muManagementProvider.notifier)
                                .joinMu(mu.id);

                            if (success && context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('새로운 뮤에 가입하신 것을 축하해요!'),
                                  showCloseIcon: true,
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeConfig.primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(80, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: manageState.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('가입'),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Stats
        Positioned(
          left: 96,
          right: 16,
          bottom: -80,
          child: Row(
            children: [
              _buildStat('멤버', mu.memberCount),
              const SizedBox(width: 24),
              _buildStat('포스트', mu.postCount),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStat(String label, int count) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
