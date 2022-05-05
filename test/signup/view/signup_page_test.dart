// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/login/view/view.dart';
import 'package:meddly/sign_up/view/view.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockSignUpCubit extends MockCubit<SignUpState> implements SignUpCubit {}

void main() {
  group('SignUpPage', () {
    var loginButtonKey = Key('loginTextButton');

    late AuthBloc authBloc;
    late SignUpCubit signUpCubit;
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      signUpCubit = MockSignUpCubit();
      authBloc = MockAuthBloc();
      authenticationRepository = MockAuthenticationRepository();
    });

    group('render', () {
      Widget createSignUpPage() {
        return RepositoryProvider.value(
          value: authenticationRepository,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => authBloc),
              BlocProvider(create: (_) => signUpCubit),
            ],
            child: MaterialApp(
                routes: {'/signup': (_) => SignUpPage()},
                home: const SignUpPage()),
          ),
        );
      }

      testWidgets('renders a SignUpForm', (tester) async {
        when(() => authBloc.state)
            .thenReturn(const AuthState.unauthenticated());
        await tester.pumpWidget(createSignUpPage());
        expect(find.byType(SignUpForm), findsOneWidget);
      });
    });

    group('navigates', () {
      Widget createSignUpPage() {
        return RepositoryProvider.value(
          value: authenticationRepository,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => authBloc),
              BlocProvider(create: (_) => signUpCubit),
            ],
            child: MaterialApp(
                routes: {'/login': (_) => LoginPage()},
                home: const SignUpPage()),
          ),
        );
      }

      testWidgets('to LoginPage when Log In is pressed', (tester) async {
        when(() => authBloc.state)
            .thenReturn(const AuthState.unauthenticated());
        await tester.pumpWidget(createSignUpPage());
        await tester.ensureVisible(find.byKey(loginButtonKey));
        await tester.tap(find.byKey(loginButtonKey));
        await tester.pumpAndSettle();

        expect(find.byType(LoginPage), findsOneWidget);
      });
    });
  });
}
