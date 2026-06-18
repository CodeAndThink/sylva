import 'package:responsive_framework/responsive_framework.dart';

enum DeviceType {
  mobile(0, 450, MOBILE),
  tablet(451, 800, TABLET),
  desktop(801, 1920, DESKTOP);

  final double start;
  final double end;
  final String name;

  const DeviceType(this.start, this.end, this.name);

  static List<Breakpoint> get breakpoints => values
      .map((e) => Breakpoint(start: e.start, end: e.end, name: e.name))
      .toList();
}
