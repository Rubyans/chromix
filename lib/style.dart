import 'package:flutter/material.dart';

/// Theme colors
class ThemeColors {
  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// Black
  static const Color black = Color(0xFF000000);

  /// White
  static const Color white = Color(0xffffffff);
}

/// Base colors
abstract class BC {
  /// Transparent
  static Color get transparent => ThemeColors.transparent;

  /// Black
  static Color get black => ThemeColors.black;

  /// White
  static Color get white => ThemeColors.white;
}

/// Base styles
abstract class BS {
  /// Font name
  static const String lstBold = "lstBold";

  /// Bold 40
  static TextStyle get lstBold40 => TextStyle(
    color: BC.black,
    fontFamily: lstBold,
    fontSize: 40,
    height: 22 / 40,
    letterSpacing: 0.0,
  );
}

/// Border radius presets
abstract class BRadius {
  /// Radius 2
  static BorderRadius get r2 => const BorderRadius.all(Radius.circular(2));

  /// Radius 4
  static BorderRadius get r4 => const BorderRadius.all(Radius.circular(4));

  /// Radius 6
  static BorderRadius get r6 => const BorderRadius.all(Radius.circular(6));

  /// Radius 8
  static BorderRadius get r8 => const BorderRadius.all(Radius.circular(8));

  /// Radius 10
  static BorderRadius get r10 => const BorderRadius.all(Radius.circular(10));

  /// Radius 12
  static BorderRadius get r12 => const BorderRadius.all(Radius.circular(12));

  /// Radius 16
  static BorderRadius get r16 => const BorderRadius.all(Radius.circular(16));

  /// Radius 24
  static BorderRadius get r24 => const BorderRadius.all(Radius.circular(24));

  /// Radius 30
  static BorderRadius get r30 => const BorderRadius.all(Radius.circular(30));

  /// Radius 40
  static BorderRadius get r40 => const BorderRadius.all(Radius.circular(40));

  /// Radius 64
  static BorderRadius get r64 => const BorderRadius.all(Radius.circular(64));

  /// Radius 200
  static BorderRadius get r200 => const BorderRadius.all(Radius.circular(200));
}
