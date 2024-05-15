import 'package:auto_route/auto_route.dart';
import 'package:vodiy_soft/config/routes/router.gr.dart';
import '../../core/resources/auth_guard.dart';
import 'route_path.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: RoutePath.splash,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: RoutePath.login,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: RootAppMain.page,
          path: RoutePath.main,
          children: [
            AutoRoute(
              page: AppMainRoute.page,
              path: '',
              children: [],
            ),
          ],
        ),
      ];
}
