import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/notification_model.dart';
import '../../providers/notification_provider.dart';
import '../../../../core/config/theme_config.dart';

class NotificationItem extends ConsumerWidget {
  final NotificationModel notification;
  final VoidCallback onDismiss;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        color: Theme.of(context).colorScheme.error,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDismiss(),
      child: InkWell(
        onTap: () {
          _handleNotificationTap(context, ref);
          if (!notification.isRead) {
            ref.read(notificationProvider.notifier).markAsRead(notification.id);
          }
        },
        child: Container(
          color: notification.isRead
              ? null
              : Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIcon(context),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notification.message,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.7),
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatTime(notification.createdAt),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    IconData iconData;
    Color color;

    switch (notification.type) {
      case NotificationType.commoreReceived:
        iconData = Icons.star;
        color = ThemeConfig.primaryColor;
        break;
      case NotificationType.thumbUp:
        iconData = Icons.thumb_up;
        color = Colors.blue;
        break;
      case NotificationType.newComment:
      case NotificationType.commentReply:
        iconData = Icons.chat_bubble;
        color = Colors.green;
        break;
      case NotificationType.muJoined:
        iconData = Icons.group_add;
        color = Colors.orange;
        break;
      case NotificationType.adminNotice:
        iconData = Icons.campaign;
        color = Colors.red;
        break;
      default: // Handle other cases safely
        iconData = Icons.help_outline;
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.1),
      ),
      child: Icon(iconData, color: color),
    );
  }

  void _handleNotificationTap(BuildContext context, WidgetRef ref) {
    // Handle navigation based on notification type and related IDs
    switch (notification.type) {
      case NotificationType.newComment:
      case NotificationType.commentReply:
      case NotificationType.thumbUp:
        if (notification.relatedPostId != null) {
          // Navigate to post detail
          // TODO: Implement navigation
        }
        break;
      case NotificationType.muJoined:
        if (notification.relatedMuId != null) {
          // Navigate to mu detail
          // TODO: Implement navigation
        }
        break;
      case NotificationType.commoreReceived:
        // Navigate to commore history
        // TODO: Implement navigation
        break;
      case NotificationType.adminNotice:
        // Show admin notice in dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(notification.title),
            content: Text(notification.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('확인'),
              ),
            ],
          ),
        );
        break;
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 7) {
      return '${time.year}.${time.month}.${time.day}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }
}
