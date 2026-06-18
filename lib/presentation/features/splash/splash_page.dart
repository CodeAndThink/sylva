import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/features/splash/splash_cubit.dart';
import 'package:sylva/presentation/features/splash/splash_navigator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(navigator: SplashNavigator(context)),
      child: const _SplashChildPage(),
    );
  }
}

class _SplashChildPage extends StatefulWidget {
  const _SplashChildPage();

  @override
  State<_SplashChildPage> createState() => __SplashChildPageState();
}

class __SplashChildPageState extends State<_SplashChildPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
