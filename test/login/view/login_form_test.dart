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

class MockUser extends Mock implements AuthUser {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}

void main() {
  const emailInputKey = Key('login_email');
  const passwordInputKey = Key('login_password');
  const signInWithGoogleButtonKey = Key('google_login_button');

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

      testWidgets('logInWithGoogle when sign in with google button is pressed',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: loginCubit,
                child: const LoginForm(),
              ),
            ),
          ),
        );
        await tester.tap(find.byKey(signInWithGoogleButtonKey));
        verify(() => loginCubit.logInWithGoogle()).called(1);
      });
    });
  });
}
