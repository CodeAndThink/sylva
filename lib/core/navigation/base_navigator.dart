import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import '../../presentation/widgets/notifications/app_flush_bar.dart';
import '../../presentation/widgets/dialogs/app_dialog.dart';
import '../../generated/l10n.dart';
import '../../core/navigation/app_router.dart';

abstract class BaseNavigator {
  final BuildContext context;

  /// Access to application dialogs
  AppDialog get dialog => AppDialog(context);

  /// Access to application notifications/alerts
  AppFlushBar get flushBar => AppFlushBar(context);

  const BaseNavigator(this.context);

  void safePop([Object? result]) {
    if (context.canPop()) {
      context.pop(result);
    }
  }

  bool isCanPop() => context.canPop();

  Future<T?> showAppBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = false,
    bool showDragHandle = true,
    bool useSafeArea = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      builder: (_) => child,
    );
  }

  void go(String path, {Object? extra}) {
    context.go(path, extra: extra);
  }

  void goNamed(String name, {Object? extra}) {
    context.goNamed(name, extra: extra);
  }

  void push(String path, {Object? extra}) {
    context.push(path, extra: extra);
  }

  Future<Object?> pushNamed(String name, {Object? extra}) async {
    return await context.pushNamed(name, extra: extra);
  }

  void replace(String path, {Object? extra}) {
    context.replace(path, extra: extra);
  }

  void replaceNamed(String name, {Object? extra}) {
    context.replaceNamed(name, extra: extra);
  }

  Future<bool?> showSaveOptions({
    required bool initialSaveAsCopy,
    required ValueChanged<bool> onOptionSelected,
  }) {
    return showModalBottomSheet<bool>(
      showDragHandle: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SaveOptionsBottomSheet(
        initialSaveAsCopy: initialSaveAsCopy,
        onOptionSelected: onOptionSelected,
      ),
    );
  }

  Future<void> goToAbout() async {
    await pushNamed(AppRouter.about);
  }
}

class _RiseUpTransition extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const _RiseUpTransition({required this.child, required this.delay});

  @override
  State<_RiseUpTransition> createState() => _RiseUpTransitionState();
}

class _RiseUpTransitionState extends State<_RiseUpTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 600.milliseconds);

    _opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _offset = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _offset, child: widget.child),
    );
  }
}

class SaveOptionsBottomSheet extends StatelessWidget {
  final bool initialSaveAsCopy;
  final ValueChanged<bool> onOptionSelected;

  const SaveOptionsBottomSheet({
    super.key,
    required this.initialSaveAsCopy,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(
        24,
        12,
        24,
        MediaQuery.of(context).padding.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.2),
              borderRadius: 2.borderRadius,
            ),
          ),
          24.height,
          Text(l10n.save, style: theme.textTheme.titleLarge),
          24.height,
          _OptionItem(
            title: l10n.createNewImage,
            subtitle: l10n.gpsRemovedSuccess,
            isSelected: initialSaveAsCopy,
            onTap: () {
              onOptionSelected(true);
              Navigator.pop(context, true);
            },
          ),
          12.height,
          _OptionItem(
            title: l10n.replaceOriginal,
            subtitle: l10n.delete_confirm_message.split('\n').first,
            isSelected: !initialSaveAsCopy,
            onTap: () {
              onOptionSelected(false);
              Navigator.pop(context, true);
            },
          ),
          24.height,
        ],
      ),
    );
  }
}

class _OptionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionItem({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: 12.borderRadius,
      child: Container(
        padding: 16.paddingAll,
        decoration: BoxDecoration(
          borderRadius: 12.borderRadius,
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? theme.colorScheme.primaryContainer.withValues(alpha: 0.1)
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isSelected ? theme.colorScheme.primary : null,
                      fontWeight: isSelected ? FontWeight.bold : null,
                    ),
                  ),
                  4.height,
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
