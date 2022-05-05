import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_helper/form_helper.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/login/view/login_form.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockUser extends Mock implements User {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}

void main() {
  const emailInputKey = Key('login_email');
  const passwordInputKey = Key('login_password');
  // const signInWithGoogleButtonKey = Key('signInWithGoogle_button');

  const testEmail = 'test@gmail.com';
  const testPassword = 'testP@ssw0rd1';
  const testEmailInvalid = 'test.com';
  const testPasswordInvalid = 'asd!';

  late LoginCubit loginCubit;
  late AuthBloc authBloc;
  late MockUser user;

  setUp(() {
    loginCubit = MockLoginCubit();
    authBloc = MockAuthBloc();
    user = MockUser();
    when(() => loginCubit.state).thenReturn(const LoginState());
    when(() => loginCubit.logInWithGoogle()).thenAnswer((_) async {});
    when(() => loginCubit.logInWithCredentials()).thenAnswer((_) async {});
  });

  group('LoginForm', () {
    Widget createLoginFormWidget() {
      return MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: loginCubit,
            child: const LoginForm(),
          ),
        ),
      );
    }

    group('calls', () {
      testWidgets('should render the login form', (WidgetTester tester) async {
        await tester.pumpWidget(createLoginFormWidget());
        await tester.pumpAndSettle();

        expect(find.byKey(emailInputKey), findsOneWidget);
        expect(find.byKey(passwordInputKey), findsOneWidget);
      });

      testWidgets('emailChanged when email changes', (tester) async {
        await tester.pumpWidget(createLoginFormWidget());
        await tester.enterText(find.byKey(emailInputKey), testEmail);
        verify(() => loginCubit.emailChanged(testEmail)).called(1);
      });

      testWidgets('passwordChanged when password changes', (tester) async {
        await tester.pumpWidget(createLoginFormWidget());
        await tester.enterText(find.byKey(passwordInputKey), testPassword);
        verify(() => loginCubit.passwordChanged(testPassword)).called(1);
      });

      // testWidgets('logInWithGoogle when sign in with google button is pressed',
      //     (tester) async {
      //   await tester.pumpWidget(
      //     MaterialApp(
      //       home: Scaffold(
      //         body: BlocProvider.value(
      //           value: loginCubit,
      //           child: const LoginForm(),
      //         ),
      //       ),
      //     ),
      //   );
      //   await tester.tap(find.byKey(signInWithGoogleButtonKey));
      //   verify(() => loginCubit.logInWithGoogle()).called(1);
      // });

      // group('render', () {
      //   testWidgets('Email inválido error text when email is invalid',
      //       (tester) async {
      //     final email = MockEmail();
      //     when(() => email.valid).thenReturn(false);
      //     when(() => email.invalid).thenReturn(true);
      //     when(() => email.value).thenReturn(testEmailInvalid);
      //     when(() => loginCubit.state).thenReturn(LoginState(email: email));
      //     await tester.pumpWidget(createLoginFormWidget());
      //     await tester.pumpAndSettle();
      //     expect(find.text('Email inválido'), findsOneWidget);
      //   });

      //   testWidgets('Contraseña inválida error text when password is invalid',
      //       (tester) async {
      //     final password = MockPassword();
      //     when(() => password.valid).thenReturn(false);
      //     when(() => password.invalid).thenReturn(true);
      //     when(() => password.value).thenReturn(testPasswordInvalid);
      //     when(() => loginCubit.state)
      //         .thenReturn(LoginState(password: password));
      //     await tester.pumpWidget(createLoginFormWidget());
      //     await tester.pumpAndSettle();
      //     expect(find.text('Contraseña inválida'), findsOneWidget);
      //   });
      // });

      // group('navigates', () {
      //   Widget createLoginFormWidget() {
      //     return MaterialApp(
      //       initialRoute: '/login',
      //       routes: {
      //         '/login': (context) => Scaffold(
      //               body: MultiBlocProvider(
      //                 providers: [
      //                   BlocProvider.value(value: loginCubit),
      //                   BlocProvider.value(value: authBloc)
      //                 ],
      //                 child: const LoginForm(),
      //               ),
      //             ),
      //       },
      //       home: BlocProvider.value(
      //         value: authBloc,
      //         child: const MainPage(),
      //       ),
      //     );
      //   }

      //   testWidgets('to HomePage when login button is pressed', (tester) async {
      //     await tester.pumpWidget(createLoginFormWidget());
      //     when(() => authBloc.state).thenReturn(AuthState.authenticated(user));
      //     when(() => user.email).thenReturn('test@gmail.com');
      //     when(() => user.id).thenReturn('usXgsa56721ihd');
      //     when(() => user.name).thenReturn('Lorenzo');
      //     when(() => user.isEmpty).thenReturn(true);

      //     expect(find.byType(MainPage), findsOneWidget);
      //   });
    });
  });
}
