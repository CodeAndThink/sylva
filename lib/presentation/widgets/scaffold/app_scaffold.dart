import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/app/theme_cubit.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/widgets/scaffold/custom_app_bar.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool showAppBar;
  final bool isShowBackground;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool extendBody;
  final Color? backgroundColor;
  final VoidCallback? onLeadingPressed;

  const AppScaffold({
    super.key,
    this.title,
    required this.body,
    this.appBar,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.showAppBar = true,
    this.isShowBackground = true,
    this.floatingActionButton,
    this.bottom,
    this.leading,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.backgroundColor,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final isDarkMode = theme.brightness == Brightness.dark;
        return Scaffold(
          backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
          extendBodyBehindAppBar: true,
          appBar: showAppBar
              ? appBar ??
                    (title != null
                        ? CustomAppBar(
                            title: title!,
                            leading: leading,
                            actions: actions,
                            automaticallyImplyLeading:
                                automaticallyImplyLeading,
                            bottom: bottom,
                            onLeadingPressed:
                                onLeadingPressed ??
                                () {
                                  Navigator.pop(context);
                                },
                          )
                        : null)
              : null,
          body: Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isDarkMode
                          ? [
                              theme.colorScheme.surface,
                              Color(0xFF081C1E),
                              Color(0xFF102C33),
                            ]
                          : const [
                              Color(0xFFF5FFFC),
                              Color(0xFFE8FBF5),
                              Color(0xFFDFF6F1),
                            ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -100,
                left: -40,
                right: 80,
                child: IgnorePointer(
                  child: Container(
                    height: 260,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          theme.colorScheme.primary.withValues(
                            alpha: isDarkMode ? 0.22 : 0.16,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                right: -20,
                child: IgnorePointer(
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          theme.colorScheme.secondary.withValues(
                            alpha: isDarkMode ? 0.16 : 0.10,
                          ),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Positioned.fill(child: body),
            ],
          ),
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          extendBody: extendBody,
        );
      },
    );
  }
}
