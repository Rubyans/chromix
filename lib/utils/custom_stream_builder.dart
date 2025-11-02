import 'package:flutter/material.dart';

/// Stream T builder
class CustomStreamBuilder<T> extends StatefulWidget {
  /// Stream source
  const CustomStreamBuilder({
    required this.stream,
    required this.initialData,
    required this.builder,
    super.key,
  });

  /// Data stream
  final Stream<T> stream;

  /// First value
  final T initialData;

  /// UI builder
  final Widget Function(BuildContext, T) builder;

  @override
  State<CustomStreamBuilder<T>> createState() => _CustomStreamBuilderState<T>();
}

class _CustomStreamBuilderState<T> extends State<CustomStreamBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.stream,
      initialData: widget.initialData,
      builder: (context, snapshot) {
        final T data = snapshot.data ?? widget.initialData;
        return widget.builder(context, data);
      },
    );
  }
}
