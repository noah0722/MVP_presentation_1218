import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

// Add your page imports here as they are created
// import '../../features/home/presentation/pages/home_page.dart';
// ... other imports

final routerProvider = Provider<GoRouter>((ref) {
  final authService = ref.watch(authServiceProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final isLoggedIn = authService.currentUser != null;
      final isGoingToAuth = state.matchedLocation.startsWith('/auth');

      // Protected routes that require authentication
      final protectedRoutes = [
        '/profile',
        '/write',
        '/notifications',
      ];

      if (!isLoggedIn && protectedRoutes.contains(state.matchedLocation)) {
        return '/auth/login';
      }

      if (isLoggedIn && isGoingToAuth) {
        return '/';
      }

      return null;
    },
    routes: [
      // Home
      GoRoute(
        path: '/',
        name: 'home',
        // builder: (context, state) => const HomePage(),
      ),

      // Auth routes
      GoRoute(
        path: '/auth/login',
        name: 'login',
        // builder: (context, state) => const LoginPage(),
      ),

      // Profile routes
      GoRoute(
        path: '/profile',
        name: 'profile',
        // builder: (context, state) => const ProfilePage(),
        routes: [
          GoRoute(
            path: 'edit',
            name: 'profileEdit',
            // builder: (context, state) => const ProfileEditPage(),
          ),
          GoRoute(
            path: 'commore',
            name: 'commore',
            // builder: (context, state) => const CommorePage(),
          ),
          GoRoute(
            path: 'posts',
            name: 'userPosts',
            // builder: (context, state) => const UserPostsPage(),
          ),
        ],
      ),

      // Mu routes
      GoRoute(
        path: '/mu/:muId',
        name: 'muDetail',
        // builder: (context, state) => MuDetailPage(muId: state.params['muId']!),
        routes: [
          GoRoute(
            path: 'info',
            name: 'muInfo',
            // builder: (context, state) => MuInfoPage(muId: state.params['muId']!),
          ),
        ],
      ),

      // Post routes
      GoRoute(
        path: '/write',
        name: 'writePost',
        // builder: (context, state) => const WritePostPage(),
      ),
      GoRoute(
        path: '/post/:postId',
        name: 'postDetail',
        // builder: (context, state) => PostDetailPage(postId: state.params['postId']!),
      ),

      // Ranking routes
      GoRoute(
        path: '/ranking',
        name: 'ranking',
        // builder: (context, state) => const RankingPage(),
      ),

      // Notification routes
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        // builder: (context, state) => const NotificationsPage(),
      ),

      // Admin routes
      GoRoute(
        path: '/admin',
        name: 'admin',
        // builder: (context, state) => const AdminPage(),
        redirect: (context, state) async {
          final isAdmin = await authService.isAdmin();
          if (!isAdmin) return '/';
          return null;
        },
        routes: [
          GoRoute(
            path: 'create-mu',
            name: 'createMu',
            // builder: (context, state) => const CreateMuPage(),
          ),
          GoRoute(
            path: 'create-account',
            name: 'createAdminAccount',
            // builder: (context, state) => const CreateAdminAccountPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          '페이지를 찾을 수 없습니다',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
  );
});
