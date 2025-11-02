import 'package:auto_route/auto_route.dart';
import 'package:chromix/screens/splash_page/page.dart';

part 'routes.gr.dart';

/// App router
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  /// Default route type
  @override
  RouteType get defaultRouteType => const RouteType.material();

  /// Constructor model
  AppRouter();

  /// App routes
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SplashRoute.page),
  ];
}
