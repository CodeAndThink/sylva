import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Centralized service for monitoring network connectivity.
/// Other services should depend on this instead of using [Connectivity] directly.
@lazySingleton
class ConnectionService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  final _controller = StreamController<bool>.broadcast();

  /// A broadcast stream that emits `true` when connected, `false` when not.
  Stream<bool> get onConnectionChanged => _controller.stream;

  /// Start listening to connectivity changes.
  /// Should be called once during app initialization.
  void init() {
    _subscription = _connectivity.onConnectivityChanged.listen(_handleChange);
    // Check initial state
    _connectivity.checkConnectivity().then(_handleChange);
  }

  void _handleChange(List<ConnectivityResult> results) {
    final connected = results.any(
      (r) =>
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.ethernet,
    );

    if (connected != _isConnected) {
      _isConnected = connected;
      _controller.add(connected);
    }
  }

  /// One-shot check for current connectivity.
  Future<bool> checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _handleChange(results);
    return _isConnected;
  }

  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    _controller.close();
  }
}
