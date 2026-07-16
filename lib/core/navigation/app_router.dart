import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sylva/data/models/process_image_model.dart';
import 'package:sylva/presentation/features/history/history_page.dart';
import 'package:sylva/presentation/features/home/home_page.dart';
import 'package:sylva/presentation/features/onbroard/onboard_page.dart';
import 'package:sylva/presentation/features/share/share_page.dart';
import 'package:sylva/presentation/features/about/about_page.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_page.dart';
import 'package:sylva/presentation/features/settings/settings_page.dart';
import 'package:sylva/presentation/features/contact/contact_page.dart';
import 'package:sylva/presentation/features/settings/widgets/privacy_policy_page.dart';
import 'package:sylva/presentation/features/settings/widgets/terms_of_service_page.dart';
import 'package:sylva/presentation/features/settings/widgets/acknowledgements_page.dart';
import 'package:sylva/presentation/features/storage_management/storage_management_page.dart';
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

  static const String about = 'about';
  static const String aboutPath = '/about';

  static const String termsOfService = 'termsOfService';
  static const String termsOfServicePath = '/termsOfService';

  static const String privacyPolicy = 'privacyPolicy';
  static const String privacyPolicyPath = '/privacyPolicy';

  static const String acknowledgements = 'acknowledgements';
  static const String acknowledgementsPath = '/acknowledgements';

  static const String storageManagement = 'storageManagement';
  static const String storageManagementPath = '/storageManagement';

  static const String photoPreview = 'photoPreview';
  static const String photoPreviewPath = '/photoPreview';

  static const String share = 'share';
  static const String sharePath = '/share';

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
        path: aboutPath,
        name: about,
        builder: (context, state) => const AboutPage(),
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
        path: termsOfServicePath,
        name: termsOfService,
        builder: (context, state) => const TermsOfServicePage(),
      ),
      GoRoute(
        path: privacyPolicyPath,
        name: privacyPolicy,
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: contactPath,
        name: contact,
        builder: (context, state) => const ContactPage(),
      ),
      GoRoute(
        path: acknowledgementsPath,
        name: acknowledgements,
        builder: (context, state) => const AcknowledgementsPage(),
      ),
      GoRoute(
        path: storageManagementPath,
        name: storageManagement,
        builder: (context, state) => const StorageManagementPage(),
      ),
      GoRoute(
        path: photoPreviewPath,
        name: photoPreview,
        builder: (context, state) {
          return PhotoPreviewPage(args: state.extra as PhotoPreviewArguments);
        },
      ),
      GoRoute(
        path: sharePath,
        name: share,
        builder: (context, state) {
          return SharePage(args: state.extra as ProcessImageModel);
        },
      ),
    ],
  );
}
