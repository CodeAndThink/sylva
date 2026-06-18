import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sylva/core/constants/app_colors.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.onLeadingPressed,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(36),
        bottomRight: Radius.circular(36),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: preferredSize.height + MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [const Color(0xCC09161B), const Color(0xB3153035)]
                  : [
                      Colors.white.withValues(alpha: 0.78),
                      const Color(0xD8E4FFF7),
                    ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
            border: Border.all(
              color: isDark
                  ? AppColors.glassStroke
                  : theme.colorScheme.secondary.withValues(alpha: 0.28),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.seed.withValues(alpha: isDark ? 0.18 : 0.08),
                blurRadius: 32,
                spreadRadius: -8,
              ),
            ],
          ),
          padding: 16.paddingHorizontal,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: NavigationToolbar(
                    leading:
                        leading ??
                        (automaticallyImplyLeading
                            ? IconButton(
                                icon: Icon(Icons.arrow_back_ios_new),
                                onPressed:
                                    onLeadingPressed ??
                                    () => Navigator.pop(context),
                              )
                            : null),
                    middle: Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: actions != null
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: actions!,
                          )
                        : null,
                    centerMiddle: true,
                  ),
                ),
                bottom ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(75 + (bottom?.preferredSize.height ?? 0));
}
