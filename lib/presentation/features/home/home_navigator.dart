import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_page.dart';

class HomeNavigator extends BaseNavigator {
  HomeNavigator(super.context);

  void goToSettings() {
    pushNamed(AppRouter.settings);
  }

  void goToPhotoPreview({required String imagePath}) {
    pushNamed(
      AppRouter.photoPreview,
      extra: PhotoPreviewArguments(imagePath: imagePath),
    );
  }

  void goToHistory() {
    pushNamed(AppRouter.history);
  }
}
