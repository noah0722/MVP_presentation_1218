import 'package:commune/features/home/presentation/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/theme_config.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize Firebase Messaging
  await _initializeMessaging();

  runApp(
    const ProviderScope(
      child: CommuneApp(),
    ),
  );
}

Future<void> _initializeMessaging() async {
  final messaging = FirebaseMessaging.instance;

  // Request permission
  await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // Get FCM token
  final token = await messaging.getToken();
  print('FCM Token: $token');

  // Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('Handling background message: ${message.messageId}');
}

class CommuneApp extends ConsumerWidget {
  const CommuneApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Commune',
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // TODO: Implement router
    );
  }
}
