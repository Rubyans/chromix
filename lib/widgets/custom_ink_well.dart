import 'package:flutter/material.dart';
import 'package:chromix/style.dart';

/// Custom inkwell
class CustomInkWell extends StatelessWidget {
  /// Tap action
  final VoidCallback? onTap;

  /// Long tap action
  final VoidCallback? onLongTap;

  /// Child widget
  final Widget child;

  /// Border radius
  final BorderRadius? borderRadius;

  /// Overlay color
  final Color? overlayColor;

  /// Padding
  final EdgeInsetsGeometry padding;

  /// Constructor model
  const CustomInkWell({
    required this.onTap,
    required this.child,
    this.onLongTap,
    this.borderRadius,
    this.overlayColor,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: overlayColor ?? BC.white.withValues(alpha: 0.3),
              highlightColor: overlayColor ?? BC.white.withValues(alpha: 0.3),
              borderRadius: borderRadius,
              onTap: onTap,
              onLongPress: onLongTap,
            ),
          ),
        ),
      ],
    );
  }
}
