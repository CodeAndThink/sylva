import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class AppFlushBar {
  final BuildContext context;

  const AppFlushBar(this.context);

  void showSuccess({required String message}) {
    _show(
      message: message,
      icon: Icons.check_circle_outline,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  void showError({required String message}) {
    _show(
      message: message,
      icon: Icons.error_outline,
      color: Theme.of(context).colorScheme.error,
    );
  }

  void showWarning({required String message}) {
    _show(
      message: message,
      icon: Icons.warning_amber_rounded,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }

  void showInfo({required String message}) {
    _show(
      message: message,
      icon: Icons.info_outline,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  void _show({
    required String message,
    required IconData icon,
    required Color color,
  }) async {
    await Haptics.vibrate(HapticsType.light);

    if (!context.mounted) return;

    Flushbar(
      message: message,
      icon: Icon(icon, size: 28.0, color: color),
      duration: 3.seconds,
      leftBarIndicatorColor: color,
      margin: 8.paddingAll,
      borderRadius: 12.borderRadius,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Theme.of(context).colorScheme.surface,
      messageColor: Theme.of(context).colorScheme.onSurface,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          offset: const Offset(0, 2),
          blurRadius: 4,
        ),
      ],
    ).show(context);
  }
}
