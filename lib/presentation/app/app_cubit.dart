import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sylva/core/services/connection_service.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

part 'app_state.dart';

@lazySingleton
class AppCubit extends BaseCubit<AppState> {
  final ConnectionService _connectionService;

  AppCubit(this._connectionService) : super(const AppState()) {
    _init();
  }

  void _init() {
    // Start connection monitoring service
    _connectionService.init();
  }

  @override
  Future<void> close() {
    _connectionService.dispose();
    return super.close();
  }
}
