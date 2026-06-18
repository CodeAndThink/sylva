import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/presentation/features/home/home_cubit.dart';
import 'package:sylva/presentation/features/home/home_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(navigator: HomeNavigator(context)),
      child: const _HomeChildPage(),
    );
  }
}

class _HomeChildPage extends StatefulWidget {
  const _HomeChildPage();

  @override
  State<_HomeChildPage> createState() => __HomeChildPageState();
}

class __HomeChildPageState extends State<_HomeChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(
          exifPreferences: ExifPreferences(saveGPSLocation: false),
        ),
        onMediaTap: (mediaCapture) {
          mediaCapture.captureRequest.when(
            single: (single) {
              debugPrint('Picture saved to ${single.file?.path}');
            },
            multiple: (multiple) {
              for (var request in multiple.fileBySensor.values) {
                debugPrint('Picture saved to ${request?.path}');
              }
            },
          );
        },
      ),
    );
  }
}
