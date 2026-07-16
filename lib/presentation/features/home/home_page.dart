import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sylva/core/utils/app_feedback.dart';
import 'package:sylva/core/constants/app_assets.dart';
import 'package:sylva/core/extensions/num_extensions.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/home/home_cubit.dart';
import 'package:sylva/presentation/features/home/home_navigator.dart';
import 'package:sylva/presentation/widgets/containers/app_transparent_container.dart';
import 'package:sylva/presentation/widgets/images/app_asset_image.dart';
import 'package:sylva/presentation/widgets/loadings/app_loading.dart';
import 'package:sylva/presentation/widgets/scaffold/app_scaffold.dart';
import 'package:sylva/presentation/widgets/tutorial/app_tutorial_helper.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
  final GlobalKey _keySettings = GlobalKey();
  final GlobalKey _keyFlash = GlobalKey();
  final GlobalKey _keyTimer = GlobalKey();
  final GlobalKey _keySwitchCamera = GlobalKey();
  final GlobalKey _keyHistory = GlobalKey();
  final GlobalKey _keyCapture = GlobalKey();
  final GlobalKey _keyUpload = GlobalKey();

  TutorialCoachMark? tutorialCoachMark;

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
  int _timerSeconds = 0; // 0 (off), 3, 10
  bool _isCountingDown = false;
  int _countdownSeconds = 0;
  IconData? _centerIcon;
  Timer? _centerIconTimer;
  late final HomeCubit _cubit;
  late ThemeData _theme;
  late S _l10n;

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
      if (mounted) {
        setState(() {
          _isCameraInitialized = false;
        });
      }
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

  void _showTutorial() {
    tutorialCoachMark = AppTutorialHelper.showTutorial(
      context: context,
      targets: _createTargets(),
    );
  }

  List<TargetFocus> _createTargets() {
    return [
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keySettings,
        title: _l10n.tutorialSettingsTitle,
        desc: _l10n.tutorialSettingsDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyFlash,
        title: _l10n.tutorialFlashTitle,
        desc: _l10n.tutorialFlashDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyTimer,
        title: _l10n.tutorialTimerTitle,
        desc: _l10n.tutorialTimerDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keySwitchCamera,
        title: _l10n.tutorialCameraTitle,
        desc: _l10n.tutorialCameraDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyHistory,
        title: _l10n.tutorialHistoryTitle,
        desc: _l10n.tutorialHistoryDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyCapture,
        title: _l10n.tutorialCaptureTitle,
        desc: _l10n.tutorialCaptureDesc,
      ),
      AppTutorialHelper.buildTarget(
        context: context,
        key: _keyUpload,
        title: _l10n.tutorialGalleryTitle,
        desc: _l10n.tutorialGalleryDesc,
      ),
    ];
  }

  @override
  void dispose() {
    _centerIconTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  void _showCenterIcon(IconData icon) {
    _centerIconTimer?.cancel();
    setState(() {
      _centerIcon = icon;
    });
    _centerIconTimer = Timer(800.milliseconds, () {
      if (mounted) {
        setState(() {
          _centerIcon = null;
        });
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      if (mounted) {
        setState(() {
          _isCameraInitialized = false;
        });
      }
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
    AppFeedback.playInteract(context);

    setState(() {
      if (_flashMode == FlashMode.off) {
        _flashMode = FlashMode.always;
      } else if (_flashMode == FlashMode.always) {
        _flashMode = FlashMode.auto;
      } else {
        _flashMode = FlashMode.off;
      }
    });

    IconData getIcon() {
      if (_flashMode == FlashMode.always) return Icons.flash_on_outlined;
      if (_flashMode == FlashMode.auto) return Icons.flash_auto_outlined;
      return Icons.flash_off_outlined;
    }

    _showCenterIcon(getIcon());

    try {
      await _controller!.setFlashMode(_flashMode);
    } catch (e) {
      debugPrint('Error setting flash mode: $e');
    }
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;
    if (_controller!.value.isTakingPicture || _isCapturing || _isCountingDown) {
      return;
    }
    AppFeedback.playInteract(context);

    if (_timerSeconds > 0) {
      setState(() {
        _isCountingDown = true;
        _countdownSeconds = _timerSeconds;
      });

      while (_countdownSeconds > 0) {
        await Future.delayed(1.seconds);
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
        _cubit.navigator.goToPhotoPreview(imagePath: file.path);
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
    _l10n = S.of(context);

    return AppScaffold(
      showAppBar: false,
      body: SafeArea(
        child: Padding(
          padding: 12.paddingAll,
          child: Column(
            children: [
              Expanded(child: _buildCameraPreview()),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Align(
              alignment: Alignment.bottomCenter,
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
          Padding(
            padding: 8.paddingBottom,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: 25.borderRadius,
                  onTap: () {
                    if (_controller == null || !_isCameraInitialized) return;
                    setState(() {
                      _currentScale = 1.0;
                      _baseScale = 1.0;
                    });
                    _controller!.setZoomLevel(1.0);
                  },
                  child: Container(
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
                        color: _currentScale > 1.0
                            ? Colors.amber
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_isCountingDown)
            Center(
              child: Text(
                _countdownSeconds.toString(),
                style: _theme.textTheme.titleLarge?.copyWith(
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
          if (!_isCountingDown && _centerIcon != null)
            Center(
              child: Icon(
                _centerIcon,
                color: Colors.white,
                size: 100,
                shadows: const [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
        ],
      );
    } else {
      return AppTransparentContainer(child: Center(child: AppLoading()));
    }
  }

  Widget _buildBottomActions() {
    return AbsorbPointer(
      absorbing: _isCapturing || _isCountingDown,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Tooltip(
                message: _l10n.help,
                child: IconButton(
                  icon: Icon(
                    Icons.help_outline_outlined,
                    color: _theme.colorScheme.onSurface,
                    size: 24,
                  ),
                  onPressed: _showTutorial,
                ),
              ),
              Tooltip(
                message: _l10n.settings,
                child: IconButton(
                  key: _keySettings,
                  icon: Icon(
                    Icons.settings_outlined,
                    color: _theme.colorScheme.onSurface,
                    size: 24,
                  ),
                  onPressed: () {
                    _cubit.navigator.goToSettings();
                  },
                ),
              ),
              Tooltip(
                message: _l10n.flashMode,
                child: IconButton(
                  key: _keyFlash,
                  icon: AnimatedSwitcher(
                    duration: 150.milliseconds,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                    child: Icon(
                      _flashMode == FlashMode.always
                          ? Icons.flash_on_outlined
                          : _flashMode == FlashMode.auto
                          ? Icons.flash_auto_outlined
                          : Icons.flash_off_outlined,
                      key: ValueKey<FlashMode>(_flashMode),
                      color:
                          _flashMode == FlashMode.always ||
                              _flashMode == FlashMode.auto
                          ? Colors.amber
                          : _theme.colorScheme.onSurface,
                      size: 24,
                    ),
                  ),
                  onPressed: _toggleFlash,
                ),
              ),
              PopupMenuButton<int>(
                key: _keyTimer,
                tooltip: _l10n.timer,
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
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                  child: Icon(
                    _timerSeconds == 0
                        ? Icons.timer_off_outlined
                        : _timerSeconds == 3
                        ? Icons.timer_3_outlined
                        : _timerSeconds == 3
                        ? Icons.timer_10_outlined
                        : Icons.timer_10,
                    color: _timerSeconds == 0
                        ? _theme.colorScheme.onSurface
                        : Colors.amber,
                    size: 24,
                  ),
                ),
                itemBuilder: (context) => [
                  _buildTimerMenuItem(value: 0, icon: Icons.timer_off_outlined),
                  _buildTimerMenuItem(value: 3, icon: Icons.timer_3),
                  _buildTimerMenuItem(value: 10, icon: Icons.timer_10),
                ],
              ),

              Tooltip(
                message: _l10n.switchCamera,
                child: IconButton(
                  key: _keySwitchCamera,
                  icon: Icon(
                    Icons.cached,
                    color: _theme.colorScheme.onSurface,
                    size: 24,
                  ),
                  onPressed: _switchCamera,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: _l10n.history,
                child: IconButton(
                  key: _keyHistory,
                  icon: Icon(
                    Icons.history_outlined,
                    color: _theme.colorScheme.onSurface,
                    size: 40,
                  ),
                  onPressed: () {
                    _cubit.navigator.goToHistory();
                  },
                ),
              ),
              Material(
                color: _isCapturing ? Colors.transparent : Colors.white,
                shape: const CircleBorder(),
                elevation: 6,
                shadowColor: _theme.colorScheme.onSurface.withValues(
                  alpha: 0.5,
                ),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  key: _keyCapture,
                  onTap: _isCapturing ? null : _takePicture,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: _isCapturing
                        ? AppLoading()
                        : Center(
                            child: AppAssetImage(
                              path: AppAssets.icCamera,
                              height: 65,
                              width: 65,
                            ),
                          ),
                  ),
                ),
              ),
              Tooltip(
                message: S.current.pickImageFromGallery,
                child: IconButton(
                  key: _keyUpload,
                  icon: Icon(
                    Icons.upload_rounded,
                    color: _theme.colorScheme.onSurface,
                    size: 40,
                  ),
                  onPressed: () async {
                    try {
                      await _controller?.pausePreview();
                    } catch (e) {
                      debugPrint('Error pausing preview: $e');
                    }
                    await _cubit.pickImageFromGallery();
                    if (mounted && _controller != null) {
                      try {
                        await _controller?.resumePreview();
                      } catch (e) {
                        debugPrint('Error resuming preview: $e');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem<int> _buildTimerMenuItem({
    required int value,
    required IconData icon,
  }) {
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
