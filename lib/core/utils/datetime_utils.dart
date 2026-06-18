import 'package:intl/intl.dart';

class DatetimeUtils {
  static DateTime fromMillisecondsSinceEpoch({
    required int millisecondsSinceEpoch,
  }) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  static String formatTimelineDay(DateTime date, [String? locale]) {
    return DateFormat.yMd(locale).format(date);
  }

  static String formatTimelineMonth(DateTime date, [String? locale]) {
    return DateFormat.yMMMM(locale).format(date);
  }

  static String formatTimelineYear(DateTime date, [String? locale]) {
    return DateFormat.y(locale).format(date);
  }
}
