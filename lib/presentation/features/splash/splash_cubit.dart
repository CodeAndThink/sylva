import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/features/splash/splash_navigator.dart';
import 'package:sylva/presentation/features/splash/splash_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class SplashCubit extends BaseCubit<SplashState> {
  final SplashNavigator navigator;
  late final AppCubit appCubit;

  SplashCubit({required this.navigator}) : super(const SplashState()) {
    appCubit = GetIt.I<AppCubit>();
    _init();
  }

  void _init() {
    Future.delayed(const Duration(seconds: 3), () {
      if (appCubit.state.isFirstTime) {
        navigator.goToOnboarding();
      } else {
        navigator.goToHome();
      }
    });
  }
}
