import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/splash_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/main_navigation_screen.dart';
import '../screens/discover/discover_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/profile/profile_detail_screen.dart';

// Router provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splash',
    routes: [
      // Splash screen
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Main navigation with shell route for bottom navigation
      ShellRoute(
        builder: (context, state, child) => MainNavigationScreen(child: child),
        routes: [
          // Home screen
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),

          // Discover screen
          GoRoute(
            path: '/discover',
            name: 'discover',
            builder: (context, state) => const DiscoverScreen(),
          ),

          // Profile detail screen
          GoRoute(
            path: '/profile/:profileId',
            name: 'profile-detail',
            builder: (context, state) {
              final profileId = state.pathParameters['profileId']!;
              return ProfileDetailScreen(profileId: profileId);
            },
          ),

          // Messages screen
          GoRoute(
            path: '/messages',
            name: 'messages',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Messages Screen'),
              ),
            ),
          ),

          // Settings screen
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.matchedLocation}',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});
