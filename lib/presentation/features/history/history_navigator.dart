import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';
import 'package:sylva/presentation/features/photo_preview/photo_preview_page.dart';

class HistoryNavigator extends BaseNavigator {
  HistoryNavigator(super.context);

  Future<void> goToPhotoPreview({required PhotoPreviewArguments args}) async {
    await pushNamed(AppRouter.photoPreview, extra: args);
  }
}
