import 'dart:ui';

class ProcessImageModel {
  final String imagePath;
  final List<Color> genColors;
  final List<Color> userColors;

  const ProcessImageModel({
    required this.imagePath,
    required this.genColors,
    required this.userColors,
  });
}
