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

  ContactCubit({required this.navigator, required this.submitContactUseCase})
    : super(const ContactState());

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

      emit(
        state.copyWith(
          summitStatus: LoadStatus.success,
          title: '',
          description: '',
        ),
      );
      navigator.flushBar.showSuccess(message: S.current.contactSuccessMessage);
    } catch (e) {
      emit(state.copyWith(summitStatus: LoadStatus.failure));
      navigator.flushBar.showError(message: S.current.contactErrorMessage);
    }
  }
}
