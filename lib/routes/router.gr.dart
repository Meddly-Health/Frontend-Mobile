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
    UserRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const EmptyRouterPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserProfileRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserProfilePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserPersonalInfoRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserPersonalInfoPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserSettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserSettingsPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserLinkedAccountsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserLinkedAccountsPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserSupervisorsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserSupervisorsPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    UserSupervisedRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserSupervisedPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    DeleteUserRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DeleteUserPage(),
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
          RouteConfig(UserRouter.name,
              path: 'user',
              parent: HomeRouter.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: UserRouter.name,
                    redirectTo: 'user/profile',
                    fullMatch: true),
                RouteConfig(UserProfileRoute.name,
                    path: 'user/profile', parent: UserRouter.name),
                RouteConfig(UserPersonalInfoRoute.name,
                    path: 'user/personal_info', parent: UserRouter.name),
                RouteConfig(UserSettingsRoute.name,
                    path: 'user/settings', parent: UserRouter.name),
                RouteConfig(UserLinkedAccountsRoute.name,
                    path: 'user/linked_accounts', parent: UserRouter.name),
                RouteConfig(UserSupervisorsRoute.name,
                    path: 'user/supervisors', parent: UserRouter.name),
                RouteConfig(UserSupervisedRoute.name,
                    path: 'user/supervised', parent: UserRouter.name),
                RouteConfig(DeleteUserRoute.name,
                    path: 'user/delete', parent: UserRouter.name)
              ])
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
/// [EmptyRouterPage]
class UserRouter extends PageRouteInfo<void> {
  const UserRouter({List<PageRouteInfo>? children})
      : super(UserRouter.name, path: 'user', initialChildren: children);

  static const String name = 'UserRouter';
}

/// generated route for
/// [UserProfilePage]
class UserProfileRoute extends PageRouteInfo<void> {
  const UserProfileRoute() : super(UserProfileRoute.name, path: 'user/profile');

  static const String name = 'UserProfileRoute';
}

/// generated route for
/// [UserPersonalInfoPage]
class UserPersonalInfoRoute extends PageRouteInfo<void> {
  const UserPersonalInfoRoute()
      : super(UserPersonalInfoRoute.name, path: 'user/personal_info');

  static const String name = 'UserPersonalInfoRoute';
}

/// generated route for
/// [UserSettingsPage]
class UserSettingsRoute extends PageRouteInfo<void> {
  const UserSettingsRoute()
      : super(UserSettingsRoute.name, path: 'user/settings');

  static const String name = 'UserSettingsRoute';
}

/// generated route for
/// [UserLinkedAccountsPage]
class UserLinkedAccountsRoute extends PageRouteInfo<void> {
  const UserLinkedAccountsRoute()
      : super(UserLinkedAccountsRoute.name, path: 'user/linked_accounts');

  static const String name = 'UserLinkedAccountsRoute';
}

/// generated route for
/// [UserSupervisorsPage]
class UserSupervisorsRoute extends PageRouteInfo<void> {
  const UserSupervisorsRoute()
      : super(UserSupervisorsRoute.name, path: 'user/supervisors');

  static const String name = 'UserSupervisorsRoute';
}

/// generated route for
/// [UserSupervisedPage]
class UserSupervisedRoute extends PageRouteInfo<void> {
  const UserSupervisedRoute()
      : super(UserSupervisedRoute.name, path: 'user/supervised');

  static const String name = 'UserSupervisedRoute';
}

/// generated route for
/// [DeleteUserPage]
class DeleteUserRoute extends PageRouteInfo<void> {
  const DeleteUserRoute() : super(DeleteUserRoute.name, path: 'user/delete');

  static const String name = 'DeleteUserRoute';
}
