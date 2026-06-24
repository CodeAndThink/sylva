import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import '../buttons/app_filled_button.dart';
import '../buttons/app_outline_button.dart';

class AppDialog {
  final BuildContext context;

  const AppDialog(this.context);

  Future<T?> showConfirm<T>({
    required String title,
    required String message,
    String? rightText,
    String? leftText,
    VoidCallback? onRight,
    VoidCallback? onLeft,
    Color? rightColor,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => _AppDialogWidget(
        headerIcon: Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 60,
        ),
        title: title,
        message: message,
        rightText: rightText,
        leftText: leftText,
        onRight: onRight,
        onLeft: onLeft,
        rightColor: rightColor,
      ),
    );
  }

  Future<T?> showAppDialog<T>({
    required Widget child,
    bool barrierDismissible = true,
    Color? barrierColor,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      builder: (_) => child,
    );
  }

  Future<T?> showError<T>({
    required String title,
    required String message,
    String? closeText,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => _AppDialogWidget(
        headerIcon: Icon(Icons.cancel_outlined, color: Colors.red, size: 60),
        title: title,
        message: message,
        rightText: closeText ?? 'Close',
        rightColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  Future<T?> showSuccess<T>({
    required String title,
    required String message,
    String? closeText,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => _AppDialogWidget(
        headerIcon: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.green,
          size: 60,
        ),
        title: title,
        message: message,
        rightText: closeText ?? 'OK',
        rightColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Future<T?> showInfo<T>({
    required String title,
    required String message,
    String? closeText,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => _AppDialogWidget(
        title: title,
        message: message,
        rightText: closeText ?? 'Got it',
      ),
    );
  }
}

class _AppDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String? rightText;
  final String? leftText;
  final VoidCallback? onRight;
  final VoidCallback? onLeft;
  final Color? rightColor;
  final Widget? headerIcon;

  const _AppDialogWidget({
    required this.title,
    required this.message,
    this.rightText,
    this.leftText,
    this.onRight,
    this.onLeft,
    this.rightColor,
    this.headerIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: 36.borderRadius),
      child: Padding(
        padding: 16.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (headerIcon != null) ...[headerIcon!, 12.height],
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            12.height,
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            24.height,
            Row(
              children: [
                if (leftText != null)
                  Expanded(
                    child: AppOutlineButton(
                      text: leftText!,
                      onPressed: () {
                        Navigator.pop(context);
                        onLeft?.call();
                      },
                    ),
                  ),
                if (leftText != null && rightText != null) 12.width,
                if (rightText != null)
                  Expanded(
                    child: AppFilledButton(
                      text: rightText!,
                      backgroundColor: rightColor,
                      onPressed: () {
                        Navigator.pop(context);
                        onRight?.call();
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
