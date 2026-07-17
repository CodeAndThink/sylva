import 'dart:ui';

/// Utility class to prevent multiple rapid taps on UI elements.
class ThrottleUtils {
  ThrottleUtils._();

  static int _lastTapTime = 0;

  /// Executes [onTap] only if the specified [delayMs] has passed since the last tap.
  static void safeOnTap(VoidCallback onTap, {int delayMs = 500}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastTapTime > delayMs) {
      _lastTapTime = now;
      onTap();
    }
  }
}
