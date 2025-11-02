import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chromix/generated/l10n.dart';
import 'package:chromix/screens/splash_page/bloc.dart';
import 'package:chromix/style.dart';
import 'package:chromix/utils/custom_stream_builder.dart';
import 'package:chromix/widgets/custom_ink_well.dart';
import 'package:chromix/widgets/custom_scaffold.dart';

/// Splash page
@RoutePage()
class SplashPage extends StatefulWidget {
  /// Constructor model
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  /// Splash bloc
  final SplashBloc _bloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return PopScope(
      canPop: false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: CustomStreamBuilder<ScreenState>(
          stream: _bloc.state,
          initialData: _bloc.currentState,
          builder: (context, state) => CustomScaffold(
            activateFullSafeArea: true,
            body: CustomInkWell(
              onTap: _bloc.onTapChangeColor,
              onLongTap: _bloc.onLongTapFibColors,
              child: Container(
                color: state.color,
                alignment: Alignment.center,
                child: AutoSizeText(
                  s.hello,
                  style: BS.lstBold40.apply(color: BC.black),
                  maxLines: 1,
                  maxFontSize: 40,
                  minFontSize: 36,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
