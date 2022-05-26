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
    HomeRouter.name: (routeData) {
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
    },
    CalendarRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const CalendarPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserPage(),
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
        RouteConfig(HomeRouter.name, path: 'home', children: [
          RouteConfig('#redirect',
              path: '',
              parent: HomeRouter.name,
              redirectTo: 'calendar',
              fullMatch: true),
          RouteConfig(CalendarRoute.name,
              path: 'calendar', parent: HomeRouter.name),
          RouteConfig(UserRoute.name, path: 'user', parent: HomeRouter.name)
        ]),
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
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [UserUpdatePage]
class UserUpdateRoute extends PageRouteInfo<void> {
  const UserUpdateRoute() : super(UserUpdateRoute.name, path: 'user_data');

  static const String name = 'UserUpdateRoute';
}

/// generated route for
/// [CalendarPage]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute() : super(CalendarRoute.name, path: 'calendar');

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [UserPage]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute() : super(UserRoute.name, path: 'user');

  static const String name = 'UserRoute';
}
