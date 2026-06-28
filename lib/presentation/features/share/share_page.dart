import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/features/share/share_cubit.dart';
import 'package:sylva/presentation/features/share/share_navigator.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShareCubit(navigator: ShareNavigator(context)),
      child: const _ShareChildPage(),
    );
  }
}

class _ShareChildPage extends StatefulWidget {
  const _ShareChildPage();

  @override
  State<_ShareChildPage> createState() => __ShareChildPageState();
}

class __ShareChildPageState extends State<_ShareChildPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'Share Image', body: Text('Share Page'));
  }
}
