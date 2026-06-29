import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';
import 'package:sylva/data/models/process_image_model.dart';

class TemplateListNavigator extends BaseNavigator {
  TemplateListNavigator(super.context);

  void navigateToShare({required ProcessImageModel args}) {
    pushNamed(AppRouter.share, extra: args);
  }
}
