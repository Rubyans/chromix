import 'package:flutter/material.dart';

/// Space widgets
class Space {
  /// Width 52
  static Widget get w52 => const _SpaceWidget(width: 52);
  /// Width 50
  static Widget get w50 => const _SpaceWidget(width: 50);
  /// Width 40
  static Widget get w40 => const _SpaceWidget(width: 40);
  /// Width 32
  static Widget get w32 => const _SpaceWidget(width: 32);
  /// Width 30
  static Widget get w30 => const _SpaceWidget(width: 30);
  /// Width 25
  static Widget get w25 => const _SpaceWidget(width: 25);
  /// Width 24
  static Widget get w24 => const _SpaceWidget(width: 24);
  /// Width 22
  static Widget get w22 => const _SpaceWidget(width: 22);
  /// Width 20
  static Widget get w20 => const _SpaceWidget(width: 20);
  /// Width 18
  static Widget get w18 => const _SpaceWidget(width: 18);
  /// Width 16
  static Widget get w16 => const _SpaceWidget(width: 16);
  /// Width 12
  static Widget get w12 => const _SpaceWidget(width: 12);
  /// Width 10
  static Widget get w10 => const _SpaceWidget(width: 10);
  /// Width 8
  static Widget get w8 => const _SpaceWidget(width: 8);
  /// Width 4
  static Widget get w4 => const _SpaceWidget(width: 4);
  /// Width 2
  static Widget get w2 => const _SpaceWidget(width: 2);
  /// Height 340
  static Widget get h340 => const _SpaceWidget(height: 340);
  /// Height 210
  static Widget get h210 => const _SpaceWidget(height: 210);
  /// Height 120
  static Widget get h120 => const _SpaceWidget(height: 120);
  /// Height 100
  static Widget get h100 => const _SpaceWidget(height: 100);
  /// Height 60
  static Widget get h60 => const _SpaceWidget(height: 60);
  /// Height 40
  static Widget get h40 => const _SpaceWidget(height: 40);
  /// Height 20
  static Widget get h20 => const _SpaceWidget(height: 20);
  /// Height 10
  static Widget get h10 => const _SpaceWidget(height: 10);
  /// Height 5
  static Widget get h5 => const _SpaceWidget(height: 5);
}

/// Space widget
class _SpaceWidget extends StatelessWidget {
  /// Constructor model
  const _SpaceWidget({this.width = 0, this.height = 0});

  /// Width
  final double width;

  /// Height
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}

/// App sizes
class Sizes {
  /// Scale
  static const double scale = 1;

  /// Size 1
  static const double s1 = 1 * scale;
  /// Size 2
  static const double s2 = 2 * scale;
  /// Size 4
  static const double s4 = 4 * scale;
  /// Size 8
  static const double s8 = 8 * scale;
  /// Size 10
  static const double s10 = 10 * scale;
  /// Size 12
  static const double s12 = 12 * scale;
  /// Size 16
  static const double s16 = 16 * scale;
  /// Size 20
  static const double s20 = 20 * scale;
  /// Size 24
  static const double s24 = 24 * scale;
  /// Size 32
  static const double s32 = 32 * scale;
  /// Size 40
  static const double s40 = 40 * scale;
  /// Size 50
  static const double s50 = 50 * scale;
  /// Size 60
  static const double s60 = 60 * scale;
  /// Size 80
  static const double s80 = 80 * scale;
  /// Size 100
  static const double s100 = 100 * scale;
}

/// App radius
class AppRadius {
  /// Scale
  static const double scale = 1;

  /// Radius 4
  static const double r4 = 4 * scale;
  /// Radius 8
  static const double r8 = 8 * scale;
  /// Radius 10
  static const double r10 = 10 * scale;
  /// Radius 12
  static const double r12 = 12 * scale;
  /// Radius 16
  static const double r16 = 16 * scale;
  /// Radius 20
  static const double r20 = 20 * scale;
  /// Radius 24
  static const double r24 = 24 * scale;
  /// Radius 30
  static const double r30 = 30 * scale;
  /// Radius 40
  static const double r40 = 40 * scale;
  /// Radius 50
  static const double r50 = 50 * scale;
  /// Radius 80
  static const double r80 = 80 * scale;
}
