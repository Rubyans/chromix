import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// Base bloc
abstract class BlocBase {
  /// Dispose resources
  void dispose();
}

/// Bloc with state
abstract class BlocBaseWithState<ScreenState> extends BlocBase {
  /// Stream controller
  late final BehaviorSubject<ScreenState> _state;

  /// Current state
  ScreenState? get currentState => _state.valueOrNull;

  /// State stream
  Stream<ScreenState> get state => _state;

  /// Constructor model
  BlocBaseWithState() {
    _state = BehaviorSubject<ScreenState>(
      onListen: doOnStateListen,
      onCancel: doOnStateStopListen,
    );
  }

  /// On listen
  void doOnStateListen() {}

  /// On stop listen
  void doOnStateStopListen() {}

  /// Set state
  void setState(ScreenState newState) {
    if (_state.isClosed) return;
    _state.add(newState);
  }

  /// Update same state
  void updateState() {
    final state = currentState;
    if (state != null) setState(state);
  }

  /// Dispose stream
  @override
  @mustCallSuper
  void dispose() {
    _state.close();
  }
}
