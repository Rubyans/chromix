import 'package:flutter/material.dart';
import 'package:chromix/style.dart';

/// Custom scaffold
class CustomScaffold extends StatelessWidget {
  /// Full safe area flag
  final bool activateFullSafeArea;

  /// Body widget
  final Widget? body;

  /// Drawer widget
  final Widget? drawer;

  /// App bar widget
  final PreferredSizeWidget? appBar;

  /// Bottom sheet
  final Widget? bottomSheet;

  /// Safe area bottom
  final bool safeAreaBottom;

  /// Safe area top
  final bool safeAreaTop;

  /// Safe area left
  final bool safeAreaLeft;

  /// Safe area right
  final bool safeAreaRight;

  /// Safe area color
  final Color? colorSafeArea;

  /// Resize flag
  final bool? resizeToAvoidBottomInset;

  /// Constructor model
  const CustomScaffold({
    required this.activateFullSafeArea,
    this.body,
    this.drawer,
    this.appBar,
    this.bottomSheet,
    this.safeAreaBottom = true,
    this.safeAreaTop = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.colorSafeArea,
    this.resizeToAvoidBottomInset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: appBar,
        drawer: drawer ?? const SizedBox.shrink(),
        body: activateFullSafeArea
            ? body ?? const SizedBox.shrink()
            : ColoredBox(
                color: colorSafeArea ?? BC.white,
                child: SafeArea(
                  top: safeAreaTop,
                  bottom: safeAreaBottom,
                  left: safeAreaLeft,
                  right: safeAreaRight,
                  child: body ?? const SizedBox.shrink(),
                ),
              ),
        bottomSheet: bottomSheet,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      ),
    );
  }
}
