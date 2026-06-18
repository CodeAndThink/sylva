import 'dart:async';

class GlobalServices {
  GlobalServices._internal();
  static final GlobalServices instance = GlobalServices._internal();
  final StreamController<void> _achievementController =
      StreamController.broadcast();
  final StreamController<void> _settingController =
      StreamController.broadcast();
  final StreamController<void> _achievementRefreshController =
      StreamController.broadcast();

  Stream<void> get achievementStream => _achievementController.stream;
  Stream<void> get settingStream => _settingController.stream;
  Stream<void> get achievementRefreshStream =>
      _achievementRefreshController.stream;

  void updateAchievement() {
    _achievementController.add(null);
  }

  void updateSetting() {
    _settingController.add(null);
  }

  void refreshAchievement() {
    _achievementRefreshController.add(null);
  }

  void disposeAchievementStream() {
    _achievementController.close();
  }

  void disposeSettingStream() {
    _settingController.close();
  }

  void disposeAchievementRefreshStream() {
    _achievementRefreshController.close();
  }

  void disposeAllStreams() {
    _achievementController.close();
    _settingController.close();
    _achievementRefreshController.close();
  }
}
