import 'package:get_it/get_it.dart';
import 'package:chromix/cache/storage.dart';
import 'package:chromix/routers/routes.dart';
import 'package:chromix/utils/localization.dart';

/// Dependency injection
final di = GetIt.instance;

/// Init injections
Future<void> initInjections() async {
  /// Language service
  di.registerSingleton(LanguageService());

  /// Local storage
  di.registerSingleton(Storage());

  /// App router
  di.registerSingleton(AppRouter());
}
