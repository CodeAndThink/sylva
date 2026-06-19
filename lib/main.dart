import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/app/locale_cubit.dart';
import 'package:sylva/presentation/app/subscription_cubit.dart';
import 'package:sylva/presentation/app/theme_cubit.dart';
import 'package:sylva/presentation/app/theme_state.dart';
import 'package:sylva/presentation/theme/app_theme.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/core/enums/device_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  // Load variables from .env
  // await dotenv.load(fileName: ".env");
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
        BlocProvider(create: (context) => locator<LocaleCubit>()),
        BlocProvider(create: (context) => locator<SubscriptionCubit>()..init()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode,
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
                theme: AppTheme.light(),
                darkTheme: AppTheme.dark(),
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
