import 'package:sylva/generated/l10n.dart';

enum TimeGroup { today, yesterday, last7Days, last30Days, older }

extension TimeGroupExtension on TimeGroup {
  String get title {
    switch (this) {
      case TimeGroup.today:
        return S.current.today;
      case TimeGroup.yesterday:
        return S.current.yesterday;
      case TimeGroup.last7Days:
        return S.current.last7Days;
      case TimeGroup.last30Days:
        return S.current.last30Days;
      case TimeGroup.older:
        return S.current.older;
    }
  }
}
