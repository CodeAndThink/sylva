// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/repositories/app_preferences_repository_impl.dart' as _i877;
import '../../data/repositories/contact_repository_impl.dart' as _i133;
import '../../domain/repositories/app_preferences_repository.dart' as _i606;
import '../../domain/repositories/contact_repository.dart' as _i482;
import '../../domain/usecases/submit_contact_usecase.dart' as _i460;
import '../../presentation/app/app_cubit.dart' as _i503;
import '../../presentation/app/interaction_cubit.dart' as _i89;
import '../../presentation/app/locale_cubit.dart' as _i687;
import '../../presentation/app/theme_cubit.dart' as _i980;
import '../services/connection_service.dart' as _i727;
import '../services/permission_service.dart' as _i165;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.lazySingletonAsync<_i214.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i727.ConnectionService>(() => _i727.ConnectionService());
    gh.lazySingleton<_i165.PermissionService>(() => _i165.PermissionService());
    gh.lazySingleton<_i482.ContactRepository>(
      () => _i133.ContactRepositoryImpl(),
    );
    gh.lazySingleton<_i460.SubmitContactUseCase>(
      () => _i460.SubmitContactUseCase(gh<_i482.ContactRepository>()),
    );
    gh.lazySingleton<_i606.AppPreferencesRepository>(
      () => _i877.AppPreferencesRepositoryImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i89.InteractionCubit>(
      () => _i89.InteractionCubit(gh<_i606.AppPreferencesRepository>()),
    );
    gh.lazySingleton<_i687.LocaleCubit>(
      () => _i687.LocaleCubit(gh<_i606.AppPreferencesRepository>()),
    );
    gh.lazySingleton<_i980.ThemeCubit>(
      () => _i980.ThemeCubit(gh<_i606.AppPreferencesRepository>()),
    );
    gh.lazySingleton<_i503.AppCubit>(
      () => _i503.AppCubit(
        gh<_i727.ConnectionService>(),
        gh<_i606.AppPreferencesRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
