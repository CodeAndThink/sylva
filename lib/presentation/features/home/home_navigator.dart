import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';

class HomeNavigator extends BaseNavigator {
  HomeNavigator(super.context);

  void goToSettings() {
    pushNamed(AppRouter.settings);
  }

  void goToPhotoPreview(String imagePath) {
    pushNamed(AppRouter.photoPreview, extra: imagePath);
  }
}
