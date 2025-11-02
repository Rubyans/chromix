import 'dart:async';

import 'package:chromix/di/injections.dart';
import 'package:chromix/generated/l10n.dart';
import 'package:chromix/routers/routes.dart';
import 'package:chromix/style.dart';
import 'package:chromix/utils/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

/// App entry point
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init dependencies
  await initInjections();

  /// Init local storage
  await GetStorage.init();

  /// Lock orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}

/// Root app widget
class App extends StatefulWidget {
  /// Constructor model
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext buildContext) {
    return ChangeNotifierProvider<LanguageService>(
      create: (context) => di<LanguageService>(),
      builder: (context, child) {
        final service = context.watch<LanguageService>();
        final l = service.locale;
        if (l != _currentLocale) {
          _currentLocale = l;
          _rebuildAllChildren(context);
        }
        return MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: l,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            scaffoldBackgroundColor: BC.white,
            bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: BC.transparent),
          ),
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerConfig: di<AppRouter>().config(),
        );
      },
    );
  }
}

/// Current locale
Locale _currentLocale = const Locale('en');

/// Force rebuild
void _rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}
