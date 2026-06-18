import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/features/paywall/paywall_cubit.dart';
import 'package:sylva/presentation/features/paywall/paywall_navigator.dart';

class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaywallCubit(navigator: PaywallNavigator(context)),
      child: const _PaywallChildPage(),
    );
  }
}

class _PaywallChildPage extends StatefulWidget {
  const _PaywallChildPage();

  @override
  State<_PaywallChildPage> createState() => __PaywallChildPageState();
}

class __PaywallChildPageState extends State<_PaywallChildPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
