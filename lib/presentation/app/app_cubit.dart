import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sylva/domain/repositories/app_preferences_repository.dart';
import 'package:sylva/core/services/connection_service.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

part 'app_state.dart';

@lazySingleton
class AppCubit extends BaseCubit<AppState> {
  final ConnectionService _connectionService;
  final AppPreferencesRepository _appPrefs;

  AppCubit(this._connectionService, this._appPrefs) : super(const AppState()) {
    _init();
  }

  Future<void> _init() async {
    // Start connection monitoring service
    _connectionService.init();

    final isFirstTime = _appPrefs.isFirstTime;
    emit(state.copyWith(isFirstTime: isFirstTime));
  }

  Future<void> completeOnboarding() async {
    await _appPrefs.setFirstTime(false);
    emit(state.copyWith(isFirstTime: false));
  }

  @override
  Future<void> close() {
    _connectionService.dispose();
    return super.close();
  }
}
