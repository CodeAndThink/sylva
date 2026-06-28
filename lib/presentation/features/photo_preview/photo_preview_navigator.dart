import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';

class PhotoPreviewNavigator extends BaseNavigator {
  PhotoPreviewNavigator(super.context);

  void navigateToShare() {
    pushNamed(AppRouter.share);
  }
}
