import 'dart:math';
import 'package:flutter/animation.dart';
import 'package:chromix/cache/session.dart';
import 'package:chromix/cache/storage.dart';
import 'package:chromix/di/injections.dart';
import 'package:chromix/style.dart';
import 'package:chromix/utils/bloc_base.dart';

/// Splash bloc
class SplashBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  /// Init state
  SplashBloc() {
    setState(ScreenState());
  }

  /// Local storage
  final _storage = di<Storage>();

  /// Init color
  void init() {
    setState(currentState.copyWith(color: BC.white));
  }

  /// Random color tap
  void onTapChangeColor() {
    final random = Random();
    final newColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    setState(currentState.copyWith(color: newColor));
  }

  /// Random Fibonacci colors tap
  Future<void> onLongTapFibColors() async {
    final random = Random();

    final dynamic storedValue = _storage.getData(Session.countOfFib);
    int fibLevel = (storedValue is int) ? storedValue : 1;

    if (fibLevel > 8) fibLevel = 1;

    final List<Color> colors = [];

    for (int i = 0; i < fibLevel; i++) {
      final color = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
      colors.add(color);
      setState(currentState.copyWith(color: color));
      await Future.delayed(const Duration(milliseconds: 400));
    }

    final chosen = colors[random.nextInt(colors.length)];

    await Future.delayed(const Duration(seconds: 1));
    setState(currentState.copyWith(color: chosen));

    await _storage.saveData(Session.countOfFib, fibLevel + 1);
  }
}

/// State data
class ScreenState {
  /// Color state
  final Color? color;

  /// Constructor state
  ScreenState({
    this.color,
  });

  /// Copy state
  ScreenState copyWith({
    Color? color,
  }) {
    return ScreenState(
      color: color ?? this.color,
    );
  }
}



