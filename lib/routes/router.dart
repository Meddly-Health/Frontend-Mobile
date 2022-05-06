import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  AutoRoute(path: '', page: HomePage),
];
