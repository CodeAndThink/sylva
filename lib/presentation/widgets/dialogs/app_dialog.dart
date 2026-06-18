import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
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

  Future<void> showImageProcessedSuccessDialog({
    required Uint8List imageBytes,
    required VoidCallback onShare,
    required VoidCallback onDone,
  }) {
    return showAppDialog(
      barrierDismissible: true,
      child: _ImageProcessedSuccessDialogWidget(
        imageBytes: imageBytes,
        onShare: onShare,
        onDone: onDone,
      ),
    );
  }

  void showCancelSubscriptionDialog() {
    final l10n = S.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.cancelMonthlyTitle),
          content: Text(l10n.cancelMonthlyMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.ok),
            ),
            TextButton(
              onPressed: () async {
                try {
                  final customerInfo = await Purchases.getCustomerInfo();
                  final urlString = customerInfo.managementURL;
                  if (urlString != null && urlString.isNotEmpty) {
                    final uri = Uri.parse(urlString);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    }
                  }
                } catch (e) {
                  debugPrint('Error launching management URL: $e');
                }
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
              child: Text(l10n.manageSubscriptions),
            ),
          ],
        );
      },
    );
  }

  Future<void> showHomeWidgetInstructions() {
    final l10n = S.of(context);
    final theme = Theme.of(context);

    Widget buildInstructionStep(String step, String text) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Text(
              step,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          12.width,
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
        ],
      );
    }

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            l10n.homeWidgetDialogTitle,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.homeWidgetDialogSubtitle,
                style: theme.textTheme.bodyMedium,
              ),
              16.height,
              buildInstructionStep('1', l10n.homeWidgetStep1),
              8.height,
              buildInstructionStep('2', l10n.homeWidgetStep2),
              8.height,
              buildInstructionStep('3', l10n.homeWidgetStep3),
              8.height,
              buildInstructionStep('4', l10n.homeWidgetStep4),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                l10n.understood,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: theme.colorScheme.surface,
        );
      },
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

  const _AppDialogWidget({
    required this.title,
    required this.message,
    this.rightText,
    this.leftText,
    this.onRight,
    this.onLeft,
    this.rightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: 12.borderRadius),
      child: Padding(
        padding: 24.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            12.height,
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
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

class _ImageProcessedSuccessDialogWidget extends StatelessWidget {
  final Uint8List imageBytes;
  final VoidCallback onShare;
  final VoidCallback onDone;

  const _ImageProcessedSuccessDialogWidget({
    required this.imageBytes,
    required this.onShare,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = S.of(context);
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    final shareText = isVi ? 'Chia sẻ' : 'Share';

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: 28.borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    width: double.infinity,
                    color: Colors.black12,
                    child: Image.memory(imageBytes, fit: BoxFit.contain),
                  ),
                ),
                20.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        l10n.success,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      8.height,
                      Text(
                        l10n.imageSaved,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                24.height,
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 24,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onShare();
                          },
                          icon: const Icon(Icons.share_rounded),
                          label: Text(shareText),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: 16.borderRadius,
                            ),
                          ),
                        ),
                      ),
                      12.width,
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onDone();
                          },
                          icon: const Icon(Icons.check_circle_rounded),
                          label: Text(l10n.finish),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: 16.borderRadius,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: 6.paddingAll,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
