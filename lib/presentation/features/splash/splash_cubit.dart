import 'dart:async';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/features/splash/splash_navigator.dart';
import 'package:sylva/presentation/features/splash/splash_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class SplashCubit extends BaseCubit<SplashState> {
  final SplashNavigator navigator;
  final AppCubit appCubit;

  SplashCubit({required this.navigator, required this.appCubit})
    : super(const SplashState());

  void init() {
    Future.delayed(const Duration(seconds: 3), () {
      if (appCubit.state.isFirstTime) {
        navigator.goToOnboarding();
      } else {
        navigator.goToHome();
      }
    });
  }
}
