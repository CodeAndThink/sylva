import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sylva/core/constants/app_assets.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/presentation/app/app_cubit.dart';
import 'package:sylva/presentation/features/splash/splash_cubit.dart';
import 'package:sylva/presentation/features/splash/splash_navigator.dart';
import 'package:sylva/presentation/widgets/images/app_asset_image.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(
        navigator: SplashNavigator(context),
        appCubit: locator<AppCubit>(),
      ),
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
  late final SplashCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<SplashCubit>();
    _cubit.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SpinKitRipple(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
            size: 200,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: AppAssetImage(
              path: AppAssets.icAppIcon,
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
