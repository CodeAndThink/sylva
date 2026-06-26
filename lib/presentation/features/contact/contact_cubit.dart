import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sylva/core/di/injection.dart';
import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/utils/device_info_helper.dart';
import 'package:sylva/domain/usecases/submit_contact_usecase.dart';
import 'package:sylva/generated/l10n.dart';
import 'package:sylva/presentation/features/contact/contact_navigator.dart';
import 'package:sylva/presentation/features/contact/contact_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class ContactCubit extends BaseCubit<ContactState> {
  final ContactNavigator navigator;
  final SubmitContactUseCase submitContactUseCase;

  static const _cooldownDuration = 60; // seconds
  static const _lastSubmitKey = 'contact_last_submit_timestamp';

  Timer? _cooldownTimer;
  final SharedPreferences _prefs = locator<SharedPreferences>();

  ContactCubit({required this.navigator, required this.submitContactUseCase})
    : super(const ContactState()) {
    _initCooldown();
  }

  void _initCooldown() {
    final lastSubmitMs = _prefs.getInt(_lastSubmitKey) ?? 0;
    if (lastSubmitMs > 0) {
      final elapsed = DateTime.now().millisecondsSinceEpoch - lastSubmitMs;
      final remainingMs = (_cooldownDuration * 1000) - elapsed;
      if (remainingMs > 0) {
        final remainingSec = (remainingMs / 1000).ceil();
        safeEmit(state.copyWith(cooldownRemaining: remainingSec));
        _startCooldownTimer(remainingSec);
      }
    }
  }

  void _startCooldownTimer(int seconds) {
    _cooldownTimer?.cancel();
    var remaining = seconds;
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remaining--;
      if (remaining <= 0) {
        timer.cancel();
        safeEmit(state.copyWith(cooldownRemaining: 0));
      } else {
        safeEmit(state.copyWith(cooldownRemaining: remaining));
      }
    });
  }

  Future<void> loadDeviceInfo() async {
    if (state.getDeviceStatus.isLoading) return;
    safeEmit(state.copyWith(getDeviceStatus: LoadStatus.loading));
    final deviceInfo = await DeviceInfoHelper.getBasicDeviceInfo();
    safeEmit(
      state.copyWith(
        getDeviceStatus: LoadStatus.success,
        deviceInfo: deviceInfo,
      ),
    );
  }

  void clearDeviceInfo() {
    emit(state.copyWith(getDeviceStatus: LoadStatus.initial, deviceInfo: ''));
  }

  void changeSelectedType({required ContactType type}) {
    emit(state.copyWith(selectedType: type));
  }

  void changeTitle({required String value}) {
    emit(state.copyWith(title: value));
  }

  void changeDescription({required String value}) {
    emit(state.copyWith(description: value));
  }

  void changeDeviceInfo({required String value}) {
    emit(state.copyWith(deviceInfo: value));
  }

  void toggleAttachDeviceInfo() {
    emit(state.copyWith(isAttached: !state.isAttached));
  }

  Future<void> submitContact() async {
    if (state.summitStatus.isLoading) return;

    // Anti-spam: check cooldown
    if (state.isCooldown) {
      navigator.flushBar.showError(
        message: S.current.contactCooldownMessage(state.cooldownRemaining),
      );
      return;
    }

    emit(state.copyWith(summitStatus: LoadStatus.loading));

    try {
      final uuid = await DeviceInfoHelper.getDeviceUuid();
      final deviceInfoString = state.isAttached ? state.deviceInfo : '';

      await submitContactUseCase(
        title: state.title,
        description: state.description,
        deviceInfo: deviceInfoString,
        uuid: uuid,
        type: state.selectedType,
      );

      // Save timestamp and start cooldown
      await _prefs.setInt(
        _lastSubmitKey,
        DateTime.now().millisecondsSinceEpoch,
      );

      emit(
        state.copyWith(
          summitStatus: LoadStatus.success,
          title: '',
          description: '',
          cooldownRemaining: _cooldownDuration,
        ),
      );
      _startCooldownTimer(_cooldownDuration);
      navigator.flushBar.showSuccess(message: S.current.contactSuccessMessage);
    } catch (e) {
      emit(state.copyWith(summitStatus: LoadStatus.failure));
      navigator.flushBar.showError(message: S.current.contactErrorMessage);
    }
  }

  @override
  Future<void> close() {
    _cooldownTimer?.cancel();
    return super.close();
  }
}
