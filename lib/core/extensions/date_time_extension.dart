extension DateTimeExtension on DateTime {
  /// Check if two dates represent the same day
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Check if the date is today
  bool get isToday {
    final now = DateTime.now();
    return isSameDay(now);
  }

  /// Check if the date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDay(yesterday);
  }

  /// Returns a formatted string in DD/MM/YYYY format
  String toFormattedDate() {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }

  /// Returns a formatted string in HH:MM format
  String toFormattedTime() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  /// Returns a formatted string in HH:MM DD/MM/YYYY format
  String toDateTimeString() {
    return '${toFormattedTime()} ${toFormattedDate()}';
  }
}
