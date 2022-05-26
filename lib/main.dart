import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/user/api/mongo_user_api.dart';
import 'package:meddly/user/repository/respository.dart';
import 'theme/theme.dart';

import 'bloc_observer.dart';
import 'routes/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var connectivityBloc = ConnectivityBloc();
  var authenticationRepository =
      AuthenticationRepository(languageCode: LanguageCode.es);

  var mongoUserApi = MongoUserApi(
      authenticationRepository: authenticationRepository, dio: Dio());

  var userRepository = UserRepository(userApi: mongoUserApi);
  var authBloc = AuthBloc(authenticationRepository: authenticationRepository);

  // Listen to the first User that comes in the stream and then stops.
  await authenticationRepository.user.first;

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        authenticationRepository: authenticationRepository,
        authBloc: authBloc,
        connectivityBloc: connectivityBloc,
        userRepository: userRepository,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp(
      {Key? key,
      required this.authenticationRepository,
      required this.authBloc,
      required this.connectivityBloc,
      required this.userRepository})
      : super(key: key);
  final AuthenticationRepository authenticationRepository;
  final AuthBloc authBloc;
  final ConnectivityBloc connectivityBloc;
  final UserRepository userRepository;

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
          BlocProvider.value(value: connectivityBloc)
        ],
        child: MaterialApp.router(
          theme: ThemeManager.lightTheme,
          debugShowCheckedModeBanner: false,
          routeInformationParser: _router.defaultRouteParser(),
          routerDelegate: _router.delegate(initialRoutes: [
            authenticationRepository.currentUser.isEmpty
                ? const WelcomeRoute()
                : const WelcomeRoute(),
          ]),
        ),
      ),
    );
  }
}
