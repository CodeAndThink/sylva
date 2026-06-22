import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';

class SplashNavigator extends BaseNavigator {
  SplashNavigator(super.context);

  void goToHome() {
    replaceNamed(AppRouter.home);
  }

  void goToOnboarding() {
    replaceNamed(AppRouter.onboarding);
  }
}
