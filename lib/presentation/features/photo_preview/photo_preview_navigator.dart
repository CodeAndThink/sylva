import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';
import 'package:sylva/presentation/features/share/share_page.dart';

class PhotoPreviewNavigator extends BaseNavigator {
  PhotoPreviewNavigator(super.context);

  void navigateToShare({required ShareArguments args}) {
    pushNamed(AppRouter.share, extra: args);
  }
}
