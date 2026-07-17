import 'package:intl/intl.dart';

/// Utility class for formatting and handling dates and times.
class DatetimeUtils {
  DatetimeUtils._();

  /// Converts a timestamp in milliseconds since epoch to a [DateTime] object.
  static DateTime fromMillisecondsSinceEpoch({
    required int millisecondsSinceEpoch,
  }) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  /// Formats a [DateTime] to a localized short date string (e.g., MM/DD/YYYY).
  static String formatTimelineDay(DateTime date, [String? locale]) {
    return DateFormat.yMd(locale).format(date);
  }

  /// Formats a [DateTime] to show the month and year (e.g., January 2026).
  static String formatTimelineMonth(DateTime date, [String? locale]) {
    return DateFormat.yMMMM(locale).format(date);
  }

  /// Formats a [DateTime] to show the year.
  static String formatTimelineYear(DateTime date, [String? locale]) {
    return DateFormat.y(locale).format(date);
  }
}
