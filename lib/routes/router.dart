import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meddly/calendar/view/calendar_page.dart';
import 'package:meddly/diagnosis/view/diagnosis_page.dart';
import 'package:meddly/measurements/view/measurements_page.dart';
import 'package:meddly/medicine/view/medicine_page.dart';
import 'package:meddly/user/view/profile/linked_accounts/view/user_linked_accounts_page.dart';
import 'package:meddly/user/view/profile/linked_accounts/view/supervised/user_supervised_page.dart';
import 'package:meddly/user/view/profile/personal_info/view/user_personal_info_page.dart';
import 'package:meddly/user/view/profile/settings/view/delete/delete_user_page.dart';
import 'package:meddly/user/view/profile/settings/view/user_settings_page.dart';
import 'package:meddly/user/view/profile/user_profile_page.dart';
import 'package:meddly/user/view/form/view/user_form_page.dart';
import 'package:meddly/welcome/view/welcome_page.dart';
import '../home/view/home_page.dart';
import '../sign_up/view/view.dart';

import '../login/view/view.dart';
import '../user/view/profile/linked_accounts/view/supervisors/user_supervisors_page.dart';

part 'router.gr.dart';

@CustomAutoRouter(
  routes: routes,
  replaceInRouteName: 'Page,Route',
  durationInMilliseconds: 100,
)
class AppRouter extends _$AppRouter {}

const List<AutoRoute> routes = [
  AutoRoute(path: 'login', page: LoginPage),
  AutoRoute(path: 'signup', page: SignUpPage),
  AutoRoute(path: 'welcome', page: WelcomePage),
  AutoRoute(
    path: 'home',
    name: 'HomeRouter',
    page: HomePage,
    children: [
      AutoRoute(path: 'diagnosis', page: DiagnosisPage),
      AutoRoute(path: 'measurements', page: MeasurementesPage),
      AutoRoute(path: 'medicine', page: MedicinePage),
      AutoRoute(path: 'calendar', page: CalendarPage, initial: true),
      AutoRoute(
        path: 'user',
        name: 'UserRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(path: 'user/profile', page: UserProfilePage, initial: true),
          AutoRoute(path: 'user/personal_info', page: UserPersonalInfoPage),
          AutoRoute(path: 'user/settings', page: UserSettingsPage),
          AutoRoute(path: 'user/linked_accounts', page: UserLinkedAccountsPage),
          AutoRoute(path: 'user/supervisors', page: UserSupervisorsPage),
          AutoRoute(path: 'user/supervised', page: UserSupervisedPage),
          AutoRoute(path: 'user/delete', page: DeleteUserPage),
        ],
      ),
    ],
  ),
  AutoRoute(path: 'user_data', page: UserUpdatePage),
];
