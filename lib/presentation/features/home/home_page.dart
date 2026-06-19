import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/presentation/features/home/home_cubit.dart';
import 'package:sylva/presentation/features/home/home_navigator.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';

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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: 12.paddingAll,
          child: CameraAwesomeBuilder.awesome(
            saveConfig: SaveConfig.photo(
              exifPreferences: ExifPreferences(saveGPSLocation: false),
            ),
            previewFit: CameraPreviewFit.contain,
            // topActionsBuilder: (state) {
            //   return (Column(
            //     children: [
            //       const Spacer(),
            //       if (state is PhotoCameraState && state.hasFilters)
            //         AwesomeFilterWidget(state: state)
            //       else if (!kIsWeb && Platform.isAndroid)
            //         AwesomeZoomSelector(state: state),
            //       AwesomeCameraModeSelector(state: state),
            //     ],
            //   ));
            // },
            middleContentBuilder: (state) {
              return (Column(
                children: [
                  const Spacer(),
                  if (!kIsWeb && Platform.isAndroid)
                    AwesomeZoomSelector(state: state),
                ],
              ));
            },
            bottomActionsBuilder: (state) {
              return Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StreamBuilder<FlashMode>(
                          stream: state.sensorConfig.flashMode$,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const SizedBox.shrink();
                            }
                            final flashMode = snapshot.data!;
                            return IconButton(
                              icon: Icon(
                                flashMode == FlashMode.on
                                    ? Icons.flash_on
                                    : Icons.flash_off,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                state.sensorConfig.setFlashMode(
                                  flashMode == FlashMode.on
                                      ? FlashMode.none
                                      : FlashMode.on,
                                );
                              },
                            );
                          },
                        ),
                        if (state is PhotoCameraState)
                          AwesomeAspectRatioButton(state: state),
                        IconButton(
                          icon: const Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            state.switchCameraSensor();
                          },
                        ),
                      ],
                    ),
                  ),
                  AppTransparentContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.flip_camera_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            state.switchCameraSensor();
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            state.when(
                              onPhotoMode: (state) => state.takePhoto(),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ),
                        48.width,
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
