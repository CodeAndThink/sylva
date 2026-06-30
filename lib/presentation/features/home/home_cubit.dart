import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sylva/presentation/features/home/home_navigator.dart';
import 'package:sylva/presentation/features/home/home_state.dart';
import 'package:sylva/presentation/widgets/cubit/base_cubit.dart';

class HomeCubit extends BaseCubit<HomeState> {
  final HomeNavigator navigator;

  HomeCubit({required this.navigator}) : super(const HomeState());

  Future<void> pickImageFromGallery() async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        navigator.goToPhotoPreview(imagePath: image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }
}
