import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sylva/presentation/features/history/history_page.dart';
import 'package:sylva/presentation/features/home/home_page.dart';
import 'package:sylva/presentation/features/onbroard/onboard_page.dart';
import 'package:sylva/presentation/features/paywall/paywall_page.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_page.dart';
import 'package:sylva/presentation/features/settings/settings_page.dart';
import 'package:sylva/presentation/features/splash/splash_page.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static const String splash = 'splash';
  static const String splashPath = '/';

  static const String onboarding = 'onboarding';
  static const String onboardingPath = '/onboarding';

  static const String home = 'home';
  static const String homePath = '/home';

  static const String history = 'history';
  static const String historyPath = '/history';

  static const String settings = 'settings';
  static const String settingsPath = '/settings';

  static const String contact = 'contact';
  static const String contactPath = '/contact';

  static const String paywall = 'paywall';
  static const String paywallPath = '/paywall';

  static const String photoPreview = 'photoPreview';
  static const String photoPreviewPath = '/photoPreview';

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: splashPath,
    routes: [
      GoRoute(
        path: splashPath,
        name: splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: onboardingPath,
        name: onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: paywallPath,
        name: paywall,
        builder: (context, state) => const PaywallPage(),
      ),
      GoRoute(
        path: homePath,
        name: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: historyPath,
        name: history,
        builder: (context, state) => const HistoryPage(),
      ),
      GoRoute(
        path: settingsPath,
        name: settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: photoPreviewPath,
        name: photoPreview,
        builder: (context, state) {
          final imagePath = state.extra as String;
          return PhotoPreviewPage(imagePath: imagePath);
        },
      ),
    ],
  );
}
