// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/login/view/view.dart';
import 'package:meddly/routes/router.dart';
import 'package:meddly/sign_up/view/view.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockUser extends Mock implements User {}

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  const createAccountButtonKey = Key('go_to_signup');

  late AuthBloc authBloc;
  late LoginCubit loginCubit;
  late User user;
  late AuthenticationRepository authenticationRepository;
  late AppRouter appRouter;

  setUp(() {
    loginCubit = MockLoginCubit();
    authBloc = MockAuthBloc();
    user = MockUser();
    appRouter = AppRouter();
    authenticationRepository = MockAuthenticationRepository();
  });

  group('LoginPage', () {
    group('render', () {
      Widget createLoginPage() {
        return RepositoryProvider.value(
          value: authenticationRepository,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => authBloc),
              BlocProvider(create: (_) => loginCubit),
            ],
            child: MaterialApp(
                routes: {'/signup': (_) => SignUpPage()},
                home: const LoginPage()),
          ),
        );
      }

      testWidgets('renders a LoginForm', (tester) async {
        when(() => authBloc.state)
            .thenReturn(const AuthState.unauthenticated());
        await tester.pumpWidget(createLoginPage());
        expect(find.byType(LoginForm), findsOneWidget);
      });
      // });
      // group('navigates', () {
      //   Widget createLoginPage() {
      //     return RepositoryProvider.value(
      //       value: authenticationRepository,
      //       child: BlocProvider.value(
      //         value: authBloc,
      //         child: MaterialApp.router(
      //           routerDelegate: appRouter.delegate(
      //               initialRoutes: [const LoginRoute(), const SignUpRoute()]),
      //           routeInformationParser: appRouter.defaultRouteParser(),
      //         ),
      //       ),
      //     );
      //   }

      //   testWidgets('to SignUpPage when Create Account is pressed',
      //       (tester) async {
      //     when(() => authBloc.state)
      //         .thenReturn(const AuthState.unauthenticated());
      //     await tester.pumpWidget(createLoginPage());
      //     await tester.ensureVisible(find.byKey(createAccountButtonKey));
      //     await tester.tap(find.byKey(createAccountButtonKey));
      //     await tester.pumpAndSettle();

      //     expect(find.byType(SignUpPage), findsOneWidget);
      //   });
    });
  });
}
