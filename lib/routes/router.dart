import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:meddly/sign_up/view/view.dart';

import '../login/view/view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(routes: routes, replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {}

const List<AutoRoute> routes = [
  AutoRoute(path: 'login', page: LoginPage),
  AutoRoute(path: 'signup', page: SignUpPage),
];
