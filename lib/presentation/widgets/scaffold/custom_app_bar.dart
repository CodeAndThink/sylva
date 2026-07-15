import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sylva/core/extensions/num_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final VoidCallback? onLeadingPressed;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final Color? primaryColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.onLeadingPressed,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.bottom,
    this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final colorScheme = primaryColor != null
        ? ColorScheme.fromSeed(
            seedColor: primaryColor!,
            brightness: theme.brightness,
          )
        : theme.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: 36.radius,
        bottomRight: 36.radius,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: preferredSize.height + MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: 36.radius,
              bottomRight: 36.radius,
            ),
            border: Border.all(
              color: colorScheme.secondary.withValues(
                alpha: 0.28,
              ),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(
                  alpha: isDark ? 0.4 : 0.3,
                ),
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
                            ? SizedBox(
                                width: 44,
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: colorScheme.primary,
                                    ),
                                    onPressed:
                                        onLeadingPressed ??
                                        () => Navigator.pop(context),
                                  ),
                                ),
                              )
                            : null),
                    middle: Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: colorScheme.primary,
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
      Size.fromHeight(60 + (bottom?.preferredSize.height ?? 0));
}
