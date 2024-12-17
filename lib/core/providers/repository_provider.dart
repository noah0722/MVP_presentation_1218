import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/firebase_service.dart';
import '../../features/auth/repositories/auth_repository.dart';
import '../../features/post/repositories/post_repository.dart';
import '../../features/mu/repositories/mu_repository.dart';
import '../../features/notification/repositories/notification_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(firebaseServiceProvider));
});

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository(ref.watch(firebaseServiceProvider));
});

final muRepositoryProvider = Provider<MuRepository>((ref) {
  return MuRepository(ref.watch(firebaseServiceProvider));
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(firebaseServiceProvider));
});
