import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/core/navigation/base_navigator.dart';
import 'package:sylva/data/entities/history_record.dart';

class HistoryNavigator extends BaseNavigator {
  HistoryNavigator(super.context);

  Future<void> goToPhotoPreview(HistoryRecord record) async {
    await pushNamed(AppRouter.photoPreview, extra: record);
  }
}
