import 'dart:ui';

class ThrottleUtils {
  ThrottleUtils._();

  static int _lastTapTime = 0;

  static void safeOnTap(VoidCallback onTap, {int delayMs = 500}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now - _lastTapTime > delayMs) {
      _lastTapTime = now;
      onTap();
    }
  }
}
