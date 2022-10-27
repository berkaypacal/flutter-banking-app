// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../view/auth/login/login_view.dart' as _i3;
import '../view/auth/register/register_view.dart' as _i4;
import '../view/auth/splash/splash_view.dart' as _i2;
import 'app_router.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreenView(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterView(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'authapp',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          AuthScreenRoute.name,
          path: 'authapp',
          children: [
            _i5.RouteConfig(
              '#redirect',
              path: '',
              parent: AuthScreenRoute.name,
              redirectTo: 'authdash',
              fullMatch: true,
            ),
            _i5.RouteConfig(
              SplashRoute.name,
              path: 'authdash',
              parent: AuthScreenRoute.name,
            ),
            _i5.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthScreenRoute.name,
            ),
            _i5.RouteConfig(
              RegisterRoute.name,
              path: 'register',
              parent: AuthScreenRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AuthScreenView]
class AuthScreenRoute extends _i5.PageRouteInfo<void> {
  const AuthScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthScreenRoute.name,
          path: 'authapp',
          initialChildren: children,
        );

  static const String name = 'AuthScreenRoute';
}

/// generated route for
/// [_i2.SplashView]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'authdash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterView]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterRoute';
}
