import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/app/interaction_cubit.dart';
import 'package:sylva/presentation/app/locale_cubit.dart';
import 'package:sylva/presentation/app/subscription_cubit.dart';
import 'package:sylva/presentation/app/theme_cubit.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/theme/app_theme.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/core/enums/device_type.dart';

import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:sylva/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = (errorDetails) {
    // Ignore or record silent errors (e.g. network image load failures) as Non-fatal
    if (errorDetails.silent) {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      return;
    }
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    // Hint: You can filter non-critical exceptions here.
    // For example, to ignore network errors (SocketException) or DioException:
    // if (error is SocketException) return true;

    // By default, record unhandled async errors as Fatal (Crash)
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  final double shortestSide =
      PlatformDispatcher.instance.views.first.physicalSize.shortestSide /
      PlatformDispatcher.instance.views.first.devicePixelRatio;
  if (shortestSide < 600) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } else {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  await configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<AppCubit>()),
        BlocProvider(create: (context) => locator<ThemeCubit>()),
        BlocProvider(create: (context) => locator<InteractionCubit>()),
        BlocProvider(create: (context) => locator<LocaleCubit>()),
        BlocProvider(create: (context) => locator<SubscriptionCubit>()..init()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode ||
            previous.seedColor != current.seedColor,
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            buildWhen: (previous, current) => previous.locale != current.locale,
            builder: (context, localeState) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
                onGenerateTitle: (context) => S.of(context).appName,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: localeState.locale,
                themeMode: themeState.themeMode,
                theme: AppTheme.light(seedColor: themeState.seedColor),
                darkTheme: AppTheme.dark(seedColor: themeState.seedColor),
                builder: (context, child) {
                  return ResponsiveBreakpoints.builder(
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: const TextScaler.linear(1.0),
                        boldText: false,
                      ),
                      child: child!,
                    ),
                    breakpoints: DeviceType.breakpoints,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
