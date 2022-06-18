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
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SignUpRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignUpPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    WelcomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const WelcomePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    LoadingRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const LoadingPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SetupRoute.name: (routeData) {
      final args = routeData.argsAs<SetupRouteArgs>(
          orElse: () => const SetupRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SetupPage(key: args.key, title: args.title),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    DiagnosisRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DiagnosisPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    MeasurementesRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const MeasurementesPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    MedicineRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const MedicinePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    CalendarRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const EmptyRouterPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    UserRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const EmptyRouterPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    CalendarRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const CalendarPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SelectSupervisedRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SelectSupervisedPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    UserProfileRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserProfilePage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    UserPersonalInfoRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserPersonalInfoPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    UserSettingsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserSettingsPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    UserLinkedAccountsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UserLinkedAccountsPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SupervisorsRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SupervisorsPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    SupervisedRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SupervisedPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
          opaque: true,
          barrierDismissible: false);
    },
    DeleteUserRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const DeleteUserPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          durationInMilliseconds: 300,
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
          RouteConfig(CalendarRouter.name,
              path: 'calendar',
              parent: HomeRouter.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: CalendarRouter.name,
                    redirectTo: 'calendar',
                    fullMatch: true),
                RouteConfig(CalendarRoute.name,
                    path: 'calendar', parent: CalendarRouter.name),
                RouteConfig(SelectSupervisedRoute.name,
                    path: 'calendar/select_supervised',
                    parent: CalendarRouter.name)
              ]),
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
class SetupRoute extends PageRouteInfo<SetupRouteArgs> {
  SetupRoute({Key? key, String title = 'Bienvenido a Meddly!'})
      : super(SetupRoute.name,
            path: 'setup', args: SetupRouteArgs(key: key, title: title));

  static const String name = 'SetupRoute';
}

class SetupRouteArgs {
  const SetupRouteArgs({this.key, this.title = 'Bienvenido a Meddly!'});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'SetupRouteArgs{key: $key, title: $title}';
  }
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
/// [EmptyRouterPage]
class CalendarRouter extends PageRouteInfo<void> {
  const CalendarRouter({List<PageRouteInfo>? children})
      : super(CalendarRouter.name, path: 'calendar', initialChildren: children);

  static const String name = 'CalendarRouter';
}

/// generated route for
/// [EmptyRouterPage]
class UserRouter extends PageRouteInfo<void> {
  const UserRouter({List<PageRouteInfo>? children})
      : super(UserRouter.name, path: 'user', initialChildren: children);

  static const String name = 'UserRouter';
}

/// generated route for
/// [CalendarPage]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute() : super(CalendarRoute.name, path: 'calendar');

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [SelectSupervisedPage]
class SelectSupervisedRoute extends PageRouteInfo<void> {
  const SelectSupervisedRoute()
      : super(SelectSupervisedRoute.name, path: 'calendar/select_supervised');

  static const String name = 'SelectSupervisedRoute';
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
