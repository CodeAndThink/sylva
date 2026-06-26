import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/services/permission_service.dart';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/features/splash/splash_navigator.dart';
import 'package:sylva/presentation/features/splash/splash_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class SplashCubit extends BaseCubit<SplashState> {
  final SplashNavigator navigator;
  final AppCubit appCubit;

  SplashCubit({required this.navigator, required this.appCubit})
    : super(const SplashState());

  Future<void> init(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    if (!context.mounted) return;

    final permissionService = locator<PermissionService>();
    final isGranted = await permissionService.checkCameraStatus();

    if (!isGranted) {
      if (!context.mounted) return;
      await permissionService.requestCameraPermission(context);
    }

    if (!context.mounted) return;
    if (appCubit.state.isFirstTime) {
      navigator.goToOnboarding();
    } else {
      navigator.goToHome();
    }
  }
}
