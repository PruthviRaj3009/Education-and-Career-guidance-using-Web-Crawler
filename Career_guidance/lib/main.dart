import 'dart:developer';
import 'package:careerguidance/screens/home.dart';
import 'package:careerguidance/screens/login.dart';
import 'package:careerguidance/theme/app_theme.dart';
import 'package:careerguidance/theme/theme_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  log('[AppInit] Starting Career Guidance App...');

  WidgetsFlutterBinding.ensureInitialized();
  log('[AppInit] Flutter bindings initialized');

  log('[AppInit] Initializing Firebase...');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  log('[AppInit] ✅ Firebase initialized successfully');

  log('[AppInit] Loading theme preferences...');
  final themeMode = await ThemeController.loadThemeMode();
  log('[AppInit] Theme mode loaded: $themeMode');

  log('[AppInit] Launching app...');
  runApp(MyApp(themeMode: themeMode));
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    log('[AppInit] Building MyApp widget');

    return ChangeNotifierProvider(
      create: (_) {
        log('[AppInit] Creating ThemeController with mode: $themeMode');
        return ThemeController(themeMode);
      },
      child: Consumer<ThemeController>(
        builder: (context, controller, _) {
          log('[AppInit] Building MaterialApp');

          return MaterialApp(
            title: 'Career Guidance',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: controller.themeMode,
            home: const AuthGate(),
          );
        },
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    log('[Navigation] Building AuthGate');

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          log('[Auth] Waiting for authentication state...');
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          log('[Auth] User authenticated, showing HomeScreen');
          return const HomeScreen();
        }

        log('[Auth] No user authenticated, showing Login');
        return const Login();
      },
    );
  }
}
