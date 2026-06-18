import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/features/onbroard/onboard_cubit.dart';
import 'package:sylva/presentation/features/onbroard/onboard_navigator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardCubit(navigator: OnBoardNavigator(context)),
      child: const _OnboardingChildPage(),
    );
  }
}

class _OnboardingChildPage extends StatefulWidget {
  const _OnboardingChildPage();

  @override
  State<_OnboardingChildPage> createState() => __OnboardingChildPageState();
}

class __OnboardingChildPageState extends State<_OnboardingChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<OnBoardCubit>().navigateToHome();
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
