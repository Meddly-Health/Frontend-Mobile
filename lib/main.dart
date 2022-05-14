import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/blocs.dart';
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
  var authenticationRespository =
      AuthenticationRepository(languageCode: LanguageCode.es);
  var authBloc = AuthBloc(authenticationRepository: authenticationRespository);

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        authenticationRepository: authenticationRespository,
        authBloc: authBloc,
        connectivityBloc: connectivityBloc,
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
      required this.connectivityBloc})
      : super(key: key);
  final AuthenticationRepository authenticationRepository;
  final AuthBloc authBloc;
  final ConnectivityBloc connectivityBloc;

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
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
                : const HomeRoute(),
          ]),
        ),
      ),
    );
  }
}
