import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meddly/calendar/view/calendar_page.dart';
import 'package:meddly/user/view/user_page.dart';
import 'package:meddly/user/view/user_update_page.dart';
import 'package:meddly/welcome/view/welcome_page.dart';
import '../home/view/home_page.dart';
import '../sign_up/view/view.dart';

import '../login/view/view.dart';

part 'router.gr.dart';

@CustomAutoRouter(
    routes: routes,
    replaceInRouteName: 'Page,Route',
    transitionsBuilder: TransitionsBuilders.noTransition,
    durationInMilliseconds: 200)
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
      AutoRoute(path: 'calendar', page: CalendarPage, initial: true),
      AutoRoute(path: 'user', page: UserPage),
    ],
  ),
  AutoRoute(path: 'user_data', page: UserUpdatePage),
];
