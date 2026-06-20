import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/core/navigation/app_router.dart';
import 'package:sylva/presentation/features/home/home_cubit.dart';
import 'package:sylva/presentation/features/home/home_navigator.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';

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

class __HomeChildPageState extends State<_HomeChildPage>
    with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isCameraInitialized = false;
  int _selectedCameraIndex = 0;
  FlashMode _flashMode = FlashMode.off;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;
  bool _isCapturing = false;
  int _timerSeconds = 0; // 0 (off), 3, 5, 10
  bool _isCountingDown = false;
  int _countdownSeconds = 0;
  late final HomeCubit _cubit;
  late ThemeData _theme;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _setCamera(_cameras[_selectedCameraIndex]);
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  Future<void> _setCamera(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller!.dispose();
    }

    _controller = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
    );

    _controller!.addListener(() {
      if (mounted) setState(() {});
      if (_controller!.value.hasError) {
        debugPrint('Camera error ${_controller!.value.errorDescription}');
      }
    });

    try {
      await _controller!.initialize();
      await _controller!.setFlashMode(_flashMode);
      _minAvailableZoom = await _controller!.getMinZoomLevel();
      _maxAvailableZoom = await _controller!.getMaxZoomLevel();
      _currentScale = 1.0;
      _baseScale = 1.0;
      if (mounted) {
        setState(() {
          _isCameraInitialized = _controller!.value.isInitialized;
        });
      }
    } catch (e) {
      debugPrint('Error initializing camera controller: $e');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera();
    }
  }

  void _switchCamera() {
    if (_cameras.length > 1) {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % _cameras.length;
      _setCamera(_cameras[_selectedCameraIndex]);
    }
  }

  void _toggleFlash() async {
    if (_controller == null || !_isCameraInitialized) return;

    setState(() {
      _flashMode = _flashMode == FlashMode.off
          ? FlashMode.always
          : FlashMode.off;
    });

    try {
      await _controller!.setFlashMode(_flashMode);
    } catch (e) {
      debugPrint('Error setting flash mode: $e');
    }
  }

  void _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    if (_controller!.value.isTakingPicture || _isCapturing || _isCountingDown) {
      return;
    }

    if (_timerSeconds > 0) {
      setState(() {
        _isCountingDown = true;
        _countdownSeconds = _timerSeconds;
      });

      while (_countdownSeconds > 0) {
        await Future.delayed(const Duration(seconds: 1));
        if (!mounted) return;
        setState(() {
          _countdownSeconds--;
        });
      }

      setState(() {
        _isCountingDown = false;
      });
    }

    setState(() {
      _isCapturing = true;
    });

    try {
      final XFile file = await _controller!.takePicture();
      if (mounted) {
        context.pushNamed(AppRouter.photoPreview, extra: file.path);
      }
    } catch (e) {
      debugPrint('Error taking picture: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return AppScaffold(
      showAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: 12.paddingAll,
          child: Column(
            children: [
              Expanded(child: _buildCameraPreview()),
              12.height,
              SizedBox(height: 120, child: _buildBottomActions()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCameraPreview() {
    if (_isCameraInitialized && _controller != null) {
      return Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: AppTransparentContainer(
                padding: EdgeInsets.zero,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onScaleStart: (details) {
                    _baseScale = _currentScale;
                  },
                  onScaleUpdate: (details) {
                    if (_controller == null || !_isCameraInitialized) {
                      return;
                    }
                    setState(() {
                      _currentScale = (_baseScale * details.scale).clamp(
                        _minAvailableZoom,
                        _maxAvailableZoom,
                      );
                    });
                    _controller!.setZoomLevel(_currentScale);
                  },
                  child: CameraPreview(_controller!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                if (_controller == null || !_isCameraInitialized) return;
                setState(() {
                  _currentScale = 1.0;
                  _baseScale = 1.0;
                });
                _controller!.setZoomLevel(1.0);
              },
              child: Container(
                margin: 8.paddingBottom,
                width: 50,
                padding: 5.paddingAll,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: 25.borderRadius,
                ),
                child: Text(
                  '${_currentScale.toStringAsFixed(1)}x',
                  textAlign: TextAlign.center,
                  style: _theme.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          if (_isCountingDown)
            Center(
              child: Text(
                _countdownSeconds.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    } else {
      return AppTransparentContainer(
        child: const Center(child: CircularProgressIndicator()),
      );
    }
  }

  Widget _buildBottomActions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: AnimatedSwitcher(
                duration: 150.milliseconds,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  _flashMode == FlashMode.always
                      ? Icons.flash_on
                      : Icons.flash_off,
                  key: ValueKey<FlashMode>(_flashMode),
                  color: _theme.colorScheme.onSurface,
                  size: 24,
                ),
              ),
              onPressed: _toggleFlash,
            ),
            PopupMenuButton<int>(
              menuPadding: EdgeInsets.zero,
              color: Colors.black54,
              constraints: const BoxConstraints(minWidth: 48, maxWidth: 48),
              borderRadius: 16.borderRadius,
              shape: RoundedRectangleBorder(borderRadius: 16.borderRadius),
              onSelected: (value) {
                setState(() {
                  _timerSeconds = value;
                });
              },
              offset: const Offset(0, -160),
              icon: AnimatedSwitcher(
                duration: 150.milliseconds,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  _timerSeconds == 0
                      ? Icons.timer_off
                      : _timerSeconds == 3
                      ? Icons.timer_3
                      : _timerSeconds == 5
                      ? Icons
                            .timer_10 // Giữ icon timer_10 do không có timer_5
                      : Icons.timer_10,
                  color: _timerSeconds == 0
                      ? _theme.colorScheme.onSurface
                      : Colors.amber,
                  size: 24,
                ),
              ),
              itemBuilder: (context) => [
                _buildTimerMenuItem(0, Icons.timer_off),
                _buildTimerMenuItem(3, Icons.timer_3),
                _buildTimerMenuItem(10, Icons.timer_10),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: _theme.colorScheme.onSurface,
                size: 24,
              ),
              onPressed: () {
                _cubit.navigator.goToSettings();
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedSwitcher(
              duration: 150.milliseconds,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: IconButton(
                key: ValueKey<int>(_selectedCameraIndex),
                icon: Icon(
                  _cameras.isNotEmpty &&
                          _cameras[_selectedCameraIndex].lensDirection ==
                              CameraLensDirection.front
                      ? Icons.camera_front
                      : Icons.camera_rear,
                  color: _theme.colorScheme.onSurface,
                  size: 40,
                ),
                onPressed: _switchCamera,
              ),
            ),
            GestureDetector(
              onTap: _isCapturing ? null : _takePicture,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: _isCapturing
                      ? Colors.grey
                      : _theme.colorScheme.onSurface,
                  shape: BoxShape.circle,
                ),
                child: _isCapturing
                    ? Center(
                        child: CircularProgressIndicator(
                          color: _theme.colorScheme.surface,
                        ),
                      )
                    : Icon(
                        Icons.camera_alt,
                        color: _theme.colorScheme.surface,
                        size: 40,
                      ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.color_lens,
                color: _theme.colorScheme.onSurface,
                size: 40,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  PopupMenuItem<int> _buildTimerMenuItem(int value, IconData icon) {
    final isSelected = _timerSeconds == value;
    return PopupMenuItem<int>(
      value: value,
      padding: EdgeInsets.zero,
      child: Center(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white24 : Colors.transparent,
            borderRadius: 10.borderRadius,
          ),
          child: Center(
            child: Icon(icon, color: isSelected ? Colors.amber : Colors.white),
          ),
        ),
      ),
    );
  }
}
