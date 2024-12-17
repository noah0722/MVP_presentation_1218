import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../core/config/theme_config.dart';
import '../../models/post_model.dart';
import 'post_content.dart';
import 'post_reactions.dart';
import 'mu_profile.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to post detail
      },
      child: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post header
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Mu profile and info
                  Expanded(
                    child: MuProfile(
                      muId: post.muId,
                      muName: post.muName,
                      profileImage: post.muProfileImage,
                      createdAt: post.createdAt,
                    ),
                  ),
                  // Join button
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement mu join
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeConfig.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(60, 32),
                    ),
                    child: const Text('가입'),
                  ),
                ],
              ),
            ),

            // Post title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                post.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 8),

            // Post content
            PostContent(post: post),

            const SizedBox(height: 8),

            // Post reactions
            PostReactions(post: post),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
