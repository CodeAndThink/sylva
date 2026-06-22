import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/core/services/connection_service.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

part 'app_state.dart';

@lazySingleton
class AppCubit extends BaseCubit<AppState> {
  final ConnectionService _connectionService;
  static const _firstTimeKey = 'is_first_time';

  AppCubit(this._connectionService) : super(const AppState()) {
    _init();
  }

  Future<void> _init() async {
    // Start connection monitoring service
    _connectionService.init();

    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool(_firstTimeKey) ?? true;
    emit(state.copyWith(isFirstTime: isFirstTime));
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstTimeKey, false);
    emit(state.copyWith(isFirstTime: false));
  }

  @override
  Future<void> close() {
    _connectionService.dispose();
    return super.close();
  }
}
