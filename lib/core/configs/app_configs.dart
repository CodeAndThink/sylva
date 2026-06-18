import 'package:sylva/core/configs/app_env_configs.dart';

class AppConfigs {
  static const String appName = "TwinFix";
  static const String packageName = "com.truongngo.sylva";
  static const String version = "0.2.0";
  static const String buildNumber = "14";

  String get privacyPolicyLink => AppEnvConfigs.privacyPolicyLink;
  String get termsOfServiceLink => AppEnvConfigs.termsOfServiceLink;
  String get mapUrlTemplate => AppEnvConfigs.mapUrlTemplate;

  static const int maxLimitScanPhoto = 200;
  static const int maxHistoryItems = 10;
  static const int historyPageSize = 50;

  /// List of experience milestones (number of deleted photos/videos) required to reach each level.
  /// Index 0: Level 1 (default 0 photos)
  /// Index 1: Level 2 (requires 10 photos)
  /// Index 2: Level 3 (requires 50 photos total)
  /// ...
  static const List<double> levelMilestones = [
    0, // Level 1
    10, // Level 2
    50, // Level 3
    150, // Level 4
    350, // Level 5
    700, // Level 6
    1200, // Level 7
    2000, // Level 8
    3500, // Level 9
    5000, // Level 10
  ];

  static const List<int> scanLimitOptions = [50, 100, 200, 300, 500, 0];
}
