// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:vodiy_soft/config/root/root_app_main.dart' as _i3;
import 'package:vodiy_soft/features/login/presantation/pages/login_screen.dart'
    as _i2;
import 'package:vodiy_soft/features/main/presatation/pages/app_main_screen.dart'
    as _i1;
import 'package:vodiy_soft/features/splash/presantation/splash_screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AppMainRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppMainScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    RootAppMain.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RootAppMain(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppMainScreen]
class AppMainRoute extends _i5.PageRouteInfo<void> {
  const AppMainRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AppMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppMainRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RootAppMain]
class RootAppMain extends _i5.PageRouteInfo<void> {
  const RootAppMain({List<_i5.PageRouteInfo>? children})
      : super(
          RootAppMain.name,
          initialChildren: children,
        );

  static const String name = 'RootAppMain';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
