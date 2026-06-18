import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';

class OnBoardNavigator extends BaseNavigator {
  OnBoardNavigator(super.context);

  void navigateToHome() {
    goNamed(AppRouter.home);
  }
}
