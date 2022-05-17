// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const LoginPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    SignUpRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignUpPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    WelcomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const WelcomePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserUpdateRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserUpdatePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LoginRoute.name, path: 'login'),
        RouteConfig(SignUpRoute.name, path: 'signup'),
        RouteConfig(WelcomeRoute.name, path: 'welcome'),
        RouteConfig(HomeRoute.name, path: ''),
        RouteConfig(UserUpdateRoute.name, path: 'user_data')
      ];
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: 'signup');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: 'welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [UserUpdatePage]
class UserUpdateRoute extends PageRouteInfo<void> {
  const UserUpdateRoute() : super(UserUpdateRoute.name, path: 'user_data');

  static const String name = 'UserUpdateRoute';
}
