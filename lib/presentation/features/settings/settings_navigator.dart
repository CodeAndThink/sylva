import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';

class SettingsNavigator extends BaseNavigator {
  SettingsNavigator(super.context);

  void goToAbout() {
    pushNamed(AppRouter.about);
  }

  void goToTermsOfService() {
    pushNamed(AppRouter.termsOfService);
  }

  void goToPrivacyPolicy() {
    pushNamed(AppRouter.privacyPolicy);
  }

  void goToContact() {
    pushNamed(AppRouter.contact);
  }

  void goToThanksAndReference() {
    pushNamed(AppRouter.acknowledgements);
  }
}
