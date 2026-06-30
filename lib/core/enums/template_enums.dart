enum PaletteDirection {
  horizontal,
  vertical;

  bool get isVertical => this == PaletteDirection.vertical;
  bool get isHorizontal => this == PaletteDirection.horizontal;
}

enum PalettePosition {
  topLeft,
  topRight,
  topCenter,
  bottomLeft,
  bottomRight,
  bottomCenter,
  centerLeft,
  centerRight,
  center;

  bool get isTopLeft => this == PalettePosition.topLeft;
  bool get isTopRight => this == PalettePosition.topRight;
  bool get isTopCenter => this == PalettePosition.topCenter;
  bool get isBottomLeft => this == PalettePosition.bottomLeft;
  bool get isBottomRight => this == PalettePosition.bottomRight;
  bool get isBottomCenter => this == PalettePosition.bottomCenter;
  bool get isCenterLeft => this == PalettePosition.centerLeft;
  bool get isCenterRight => this == PalettePosition.centerRight;
  bool get isCenter => this == PalettePosition.center;
}

enum PaletteShape {
  none,
  circle,
  square,
  diamond,
  capsule,
  roundedSquare;

  bool get isNone => this == PaletteShape.none;
  bool get isCircle => this == PaletteShape.circle;
  bool get isSquare => this == PaletteShape.square;
  bool get isDiamond => this == PaletteShape.diamond;
  bool get isCapsule => this == PaletteShape.capsule;
  bool get isRoundedSquare => this == PaletteShape.roundedSquare;
}

enum ShareTextOption {
  none,
  hex,
  rgba;

  bool get isNone => this == ShareTextOption.none;
  bool get isHex => this == ShareTextOption.hex;
  bool get isRgba => this == ShareTextOption.rgba;
}

enum ShareTextPosition {
  top,
  bottom,
  left,
  right,
  inside;

  bool get isTop => this == ShareTextPosition.top;
  bool get isBottom => this == ShareTextPosition.bottom;
  bool get isLeft => this == ShareTextPosition.left;
  bool get isRight => this == ShareTextPosition.right;
  bool get isInside => this == ShareTextPosition.inside;
}
