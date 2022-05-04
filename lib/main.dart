// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var authenticationRespository = AuthenticationRepository();
  runApp(MyApp(
    authenticationRepository: authenticationRespository,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);
  final AuthenticationRepository authenticationRepository;

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(initialRoutes: [const LoginRoute()]),
      ),
    );
  }
}
