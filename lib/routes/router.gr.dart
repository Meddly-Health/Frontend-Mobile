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
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    SignUpRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignUpPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    WelcomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const WelcomePage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    LoadingRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const LoadingPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    SetupRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SetupPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    DiagnosisRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DiagnosisPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    MeasurementesRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const MeasurementesPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    MedicineRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const MedicinePage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    CalendarRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const CalendarPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    UserRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const EmptyRouterPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    UserProfileRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserProfilePage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    UserPersonalInfoRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserPersonalInfoPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    UserSettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserSettingsPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    UserLinkedAccountsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserLinkedAccountsPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    SupervisorsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SupervisorsPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    SupervisedRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SupervisedPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    },
    DeleteUserRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DeleteUserPage(),
          durationInMilliseconds: 100,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LoginRoute.name, path: 'login'),
        RouteConfig(SignUpRoute.name, path: 'signup'),
        RouteConfig(WelcomeRoute.name, path: 'welcome'),
        RouteConfig(LoadingRoute.name, path: 'loading'),
        RouteConfig(HomeRouter.name, path: 'home', children: [
          RouteConfig('#redirect',
              path: '',
              parent: HomeRouter.name,
              redirectTo: 'calendar',
              fullMatch: true),
          RouteConfig(DiagnosisRoute.name,
              path: 'diagnosis', parent: HomeRouter.name),
          RouteConfig(MeasurementesRoute.name,
              path: 'measurements', parent: HomeRouter.name),
          RouteConfig(MedicineRoute.name,
              path: 'medicine', parent: HomeRouter.name),
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
                RouteConfig(SupervisorsRoute.name,
                    path: 'user/supervisors', parent: UserRouter.name),
                RouteConfig(SupervisedRoute.name,
                    path: 'user/supervised', parent: UserRouter.name),
                RouteConfig(DeleteUserRoute.name,
                    path: 'user/delete', parent: UserRouter.name)
              ])
        ]),
        RouteConfig(SetupRoute.name, path: 'setup')
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
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: 'loading');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [HomePage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [SetupPage]
class SetupRoute extends PageRouteInfo<void> {
  const SetupRoute() : super(SetupRoute.name, path: 'setup');

  static const String name = 'SetupRoute';
}

/// generated route for
/// [DiagnosisPage]
class DiagnosisRoute extends PageRouteInfo<void> {
  const DiagnosisRoute() : super(DiagnosisRoute.name, path: 'diagnosis');

  static const String name = 'DiagnosisRoute';
}

/// generated route for
/// [MeasurementesPage]
class MeasurementesRoute extends PageRouteInfo<void> {
  const MeasurementesRoute()
      : super(MeasurementesRoute.name, path: 'measurements');

  static const String name = 'MeasurementesRoute';
}

/// generated route for
/// [MedicinePage]
class MedicineRoute extends PageRouteInfo<void> {
  const MedicineRoute() : super(MedicineRoute.name, path: 'medicine');

  static const String name = 'MedicineRoute';
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
/// [SupervisorsPage]
class SupervisorsRoute extends PageRouteInfo<void> {
  const SupervisorsRoute()
      : super(SupervisorsRoute.name, path: 'user/supervisors');

  static const String name = 'SupervisorsRoute';
}

/// generated route for
/// [SupervisedPage]
class SupervisedRoute extends PageRouteInfo<void> {
  const SupervisedRoute()
      : super(SupervisedRoute.name, path: 'user/supervised');

  static const String name = 'SupervisedRoute';
}

/// generated route for
/// [DeleteUserPage]
class DeleteUserRoute extends PageRouteInfo<void> {
  const DeleteUserRoute() : super(DeleteUserRoute.name, path: 'user/delete');

  static const String name = 'DeleteUserRoute';
}
