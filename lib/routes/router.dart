import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meddly/calendar/view/select_supervised_page.dart';
import 'package:meddly/user/view/profile/basic_info/user_basic_info_page.dart';
import '../calendar/view/calendar_page.dart';
import '../diagnosis/view/diagnosis_page.dart';
import '../measurements/view/measurements_page.dart';
import '../medicine/view/medicine_page.dart';
import '../setup/view/setup_page.dart';
import '../supervisors/view/supervised_page.dart';
import '../supervisors/view/supervisors_page.dart';
import '../supervisors/view/user_linked_accounts_page.dart';
import '../user/view/profile/settings/view/delete/delete_user_page.dart';
import '../user/view/profile/settings/view/user_settings_page.dart';
import '../user/view/profile/view/user_profile_page.dart';
import '../welcome/view/welcome_page.dart';
import '../auth/view/loading_page.dart';
import '../home/view/home_page.dart';
import '../sign_up/view/view.dart';

import '../login/view/view.dart';

part 'router.gr.dart';

@CustomAutoRouter(
    routes: routes,
    replaceInRouteName: 'Page,Route',
    durationInMilliseconds: 300,
    transitionsBuilder: TransitionsBuilders.noTransition)
class AppRouter extends _$AppRouter {}

const List<AutoRoute> routes = [
  AutoRoute(path: 'login', page: LoginPage),
  AutoRoute(path: 'signup', page: SignUpPage),
  AutoRoute(path: 'welcome', page: WelcomePage),
  AutoRoute(path: 'loading', page: LoadingPage),
  AutoRoute(
    path: 'home',
    name: 'HomeRouter',
    page: HomePage,
    children: [
      AutoRoute(path: 'diagnosis', page: DiagnosisPage),
      AutoRoute(path: 'measurements', page: MeasurementesPage),
      AutoRoute(path: 'medicine', page: MedicinePage),
      AutoRoute(
        path: 'calendar',
        page: EmptyRouterPage,
        initial: true,
        name: 'CalendarRouter',
        children: [
          AutoRoute(path: 'calendar', page: CalendarPage, initial: true),
          AutoRoute(
              path: 'calendar/select_supervised', page: SelectSupervisedPage),
        ],
      ),
      AutoRoute(
        path: 'user',
        name: 'UserRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: 'user/profile', page: UserProfilePage, initial: true),
          AutoRoute(path: 'user/basic_info', page: UserBasicInfoPage),
          AutoRoute(path: 'user/settings', page: UserSettingsPage),
          AutoRoute(path: 'user/linked_accounts', page: UserLinkedAccountsPage),
          AutoRoute(path: 'user/supervisors', page: SupervisorsPage),
          AutoRoute(path: 'user/supervised', page: SupervisedPage),
          AutoRoute(path: 'user/delete', page: DeleteUserPage),
        ],
      ),
    ],
  ),
  AutoRoute(path: 'setup', page: SetupPage),
];
