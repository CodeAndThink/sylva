import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sylva/presentation/features/home/home_navigator.dart';
import 'package:sylva/presentation/features/home/home_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeNavigator navigator;

  HomeCubit({required this.navigator}) : super(const HomeState());

  Future<void> pickImageFromGallery() async {
    try {
      PlatformFile? file = await FilePicker.pickFile(type: FileType.image);
      if (file != null && file.path != null) {
        navigator.goToPhotoPreview(imagePath: file.path!);
      }
    } catch (e) {
      debugPrint('Error picking file: $e');
    }
  }
}
