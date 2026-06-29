import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';
import 'package:sylva/data/models/process_image_model.dart';

class PhotoPreviewNavigator extends BaseNavigator {
  PhotoPreviewNavigator(super.context);

  void navigateToTemplateList({required ProcessImageModel args}) {
    pushNamed(AppRouter.templateList, extra: args);
  }
}
