import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'blocs.dart';
import 'user/api/fastapi_user_api.dart';
import 'package:user_repository/user_repository.dart';
import 'theme/theme.dart';

import 'bloc_observer.dart';
import 'routes/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapater());

  BlocOverrides.runZoned(
    () {
      var connectivityBloc = ConnectivityBloc();
      var authenticationRepository =
          AuthenticationRepository(languageCode: LanguageCode.es);

      var fastApiUserApi = FastApiUserApi(
          authenticationRepository: authenticationRepository, dio: Dio());

      var userRepository = UserRepository(userApi: fastApiUserApi);

      var authBloc =
          AuthBloc(authenticationRepository: authenticationRepository);
      var userBloc = UserBloc(userRepository, authenticationRepository);
      var supervisorsBloc = SupervisorsBloc(
          userRepository: userRepository,
          authenticationRepository: authenticationRepository);

      runApp(MyApp(
        authenticationRepository: authenticationRepository,
        authBloc: authBloc,
        connectivityBloc: connectivityBloc,
        userRepository: userRepository,
        userBloc: userBloc,
        supervisorsBloc: supervisorsBloc,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.authenticationRepository,
    required this.authBloc,
    required this.userBloc,
    required this.supervisorsBloc,
    required this.connectivityBloc,
    required this.userRepository,
  }) : super(key: key);
  final AuthenticationRepository authenticationRepository;
  final AuthBloc authBloc;
  final ConnectivityBloc connectivityBloc;
  final UserRepository userRepository;
  final UserBloc userBloc;
  final SupervisorsBloc supervisorsBloc;

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider.value(value: userRepository)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: authBloc),
          BlocProvider.value(value: connectivityBloc),
          BlocProvider.value(value: userBloc),
          BlocProvider.value(value: supervisorsBloc),
        ],
        child: MaterialApp.router(
          theme: ThemeManager.lightTheme,
          debugShowCheckedModeBanner: false,
          routeInformationParser: _router.defaultRouteParser(),
          routerDelegate: _router.delegate(initialRoutes: [
            authenticationRepository.currentUser.isEmpty
                ? const WelcomeRoute()
                : const LoadingRoute(),
          ]),
        ),
      ),
    );
  }
}
