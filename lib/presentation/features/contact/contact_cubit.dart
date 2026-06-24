import 'package:sylva/core/enums/contact_type.dart';
import 'package:sylva/core/enums/load_status.dart';
import 'package:sylva/core/utils/device_info_helper.dart';
import 'package:sylva/domain/usecases/submit_contact_usecase.dart';
import 'package:sylva/presentation/features/contact/contact_navigator.dart';
import 'package:sylva/presentation/features/contact/contact_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class ContactCubit extends BaseCubit<ContactState> {
  final ContactNavigator navigator;
  final SubmitContactUseCase submitContactUseCase;

  ContactCubit({required this.navigator, required this.submitContactUseCase})
    : super(const ContactState());

  void changeSelectedType({required ContactType type}) {
    emit(state.copyWith(selectedType: type));
  }

  void changeTitle({required String value}) {
    emit(state.copyWith(title: value));
  }

  void changeDescription({required String value}) {
    emit(state.copyWith(description: value));
  }

  Future<void> submitContact() async {
    if (state.summitStatus.isLoading) return;

    emit(state.copyWith(summitStatus: LoadStatus.loading));

    try {
      final deviceInfo = await DeviceInfoHelper.getBasicDeviceInfo();

      await submitContactUseCase(
        title: state.title,
        description: state.description,
        deviceInfo: deviceInfo,
        type: state.selectedType,
      );

      emit(state.copyWith(summitStatus: LoadStatus.success));
    } catch (e) {
      emit(state.copyWith(summitStatus: LoadStatus.failure));
    }
  }
}
