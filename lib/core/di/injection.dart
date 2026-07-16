import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/app/locale_cubit.dart';
import 'package:sylva/presentation/app/theme_cubit.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'injection.config.dart';
import 'package:sylva/core/services/connection_service.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  await locator.init();
  final prefs = await SharedPreferences.getInstance();
  if (!locator.isRegistered<SharedPreferences>()) {
    locator.registerLazySingleton<SharedPreferences>(() => prefs);
  }

  if (!locator.isRegistered<ConnectionService>()) {
    locator.registerLazySingleton(() => ConnectionService());
  }

  if (!locator.isRegistered<AppCubit>()) {
    locator.registerLazySingleton(
      () => AppCubit(
        locator<ConnectionService>(),
        locator<AppPreferencesRepository>(),
      ),
    );
  }
  if (!locator.isRegistered<ThemeCubit>()) {
    locator.registerLazySingleton(
      () => ThemeCubit(locator<AppPreferencesRepository>()),
    );
  }
  if (!locator.isRegistered<LocaleCubit>()) {
    locator.registerLazySingleton(
      () => LocaleCubit(locator<AppPreferencesRepository>()),
    );
  }
}
