import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:meddly/blocs.dart';
import 'package:meddly/sign_up/view/view.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockSignUpCubit extends MockCubit<SignUpState> implements SignUpCubit {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}

class MockConfirmedPassword extends Mock implements ConfirmedPassword {}

void main() {
  const emailInputKey = Key('sign_up_email');
  const passwordInputKey = Key('sign_up_password');
  const confirmedPasswordInputKey = Key('sign_up_confirmed_password');

  const signUpButtonKey = Key('sign_up_button');

  const signInWithGoogleButtonKey = Key('google_login_button');

  const testEmail = 'test@gmail.com';
  const testPassword = 'testP@ssw0rd!';
  const testEmailInvalid = 'test.com';
  const testPasswordInvalid = 'asd!';
  const testConfirmedPasswordInvalid = 'asd!12';

  late SignUpCubit signUpCubit;
  setUp(() {
    signUpCubit = MockSignUpCubit();
    when(() => signUpCubit.state).thenReturn(const SignUpState());
    when(() => signUpCubit.logInWithGoogle()).thenAnswer((_) async {});
    when(() => signUpCubit.signUpFormSubmitted()).thenAnswer((_) async {});
  });

  group('SignUpForm', () {
    Widget createLoginFormWidget() {
      return MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: signUpCubit,
            child: const SignUpForm(),
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
        verify(() => signUpCubit.emailChanged(testEmail)).called(1);
      });

      testWidgets('passwordChanged when password changes', (tester) async {
        await tester.pumpWidget(createLoginFormWidget());
        await tester.enterText(find.byKey(passwordInputKey), testPassword);
        verify(() => signUpCubit.passwordChanged(testPassword)).called(1);
      });

      testWidgets('confirmedPasswordChanged when confirmed password changes',
          (tester) async {
        await tester.pumpWidget(createLoginFormWidget());
        await tester.enterText(
            find.byKey(confirmedPasswordInputKey), testPassword);
        verify(() => signUpCubit.confirmedPasswordChanged(testPassword))
            .called(1);
      });

      testWidgets('not signUpFormSubmitted when sign in button is called',
          (WidgetTester tester) async {
        await tester.pumpWidget(createLoginFormWidget());
        await tester.tap(find.byKey(signUpButtonKey));
        verifyNever(() => signUpCubit.signUpFormSubmitted());
      });

      testWidgets('signUpFormSubmitted when sign in button is called',
          (WidgetTester tester) async {
        when(() => signUpCubit.state).thenReturn(const SignUpState(
            email: Email.dirty(testEmail),
            password: Password.dirty(testPassword),
            confirmedPassword: ConfirmedPassword.dirty(
                value: testPassword, password: testPassword),
            status: FormzStatus.valid));

        await tester.pumpWidget(createLoginFormWidget());
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(signUpButtonKey));
        verify(() => signUpCubit.signUpFormSubmitted()).called(1);
      });
    });

    testWidgets('logInWithGoogle when sign in with google button is pressed',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: signUpCubit,
              child: const SignUpForm(),
            ),
          ),
        ),
      );
      await tester.tap(find.byKey(signInWithGoogleButtonKey));
      verify(() => signUpCubit.logInWithGoogle()).called(1);
    });

    group('render', () {
      testWidgets('Email inválido error text when email is invalid',
          (tester) async {
        final email = MockEmail();
        when(() => email.valid).thenReturn(false);
        when(() => email.invalid).thenReturn(true);
        when(() => email.value).thenReturn(testEmailInvalid);
        when(() => signUpCubit.state).thenReturn(SignUpState(email: email));
        await tester.pumpWidget(createLoginFormWidget());
        await tester.pumpAndSettle();
        expect(find.text('El email es inválido.'), findsOneWidget);
      });

      testWidgets('Contraseña inválida error text when password is invalid',
          (tester) async {
        final password = MockPassword();
        when(() => password.valid).thenReturn(false);
        when(() => password.invalid).thenReturn(true);
        when(() => password.value).thenReturn(testPasswordInvalid);
        when(() => signUpCubit.state)
            .thenReturn(SignUpState(password: password));
        await tester.pumpWidget(createLoginFormWidget());
        await tester.pumpAndSettle();
        expect(
            find.text(
                'La contraseña debe poseer al menos 8 caracteres e incluir al menos un número y al menos un carácter especial.'),
            findsOneWidget);
      });

      testWidgets(
          'Las contraseñas no coinciden error text when password is invalid',
          (tester) async {
        final confirmedPassword = MockConfirmedPassword();
        final password = MockPassword();

        when(() => password.valid).thenReturn(false);
        when(() => password.invalid).thenReturn(true);
        when(() => password.value).thenReturn(testPasswordInvalid);

        when(() => confirmedPassword.valid).thenReturn(false);
        when(() => confirmedPassword.invalid).thenReturn(true);
        when(() => confirmedPassword.value)
            .thenReturn(testConfirmedPasswordInvalid);
        when(() => signUpCubit.state).thenReturn(SignUpState(
            password: password, confirmedPassword: confirmedPassword));
        await tester.pumpWidget(createLoginFormWidget());
        await tester.pumpAndSettle();
        expect(find.text('Las contraseñas no coinciden.'), findsOneWidget);
      });
    });
  });
}
