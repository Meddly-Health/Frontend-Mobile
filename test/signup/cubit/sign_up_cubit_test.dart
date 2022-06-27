import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_helper/form_helper.dart';
import 'package:formz/formz.dart';
import 'package:meddly/blocs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = Email.dirty(invalidEmailString);

  const validEmailString = 'test@gmail.com';
  const validEmail = Email.dirty(validEmailString);

  const invalidPasswordString = 'invalid';
  const invalidPassword = Password.dirty(invalidPasswordString);

  const validPasswordString = 't0pS3cret1234!';
  const validPassword = Password.dirty(validPasswordString);

  const invalidNameString = 'invalid!';
  const invalidName = Name.dirty(invalidNameString);

  const validNameString = 'lorenzo';
  const validName = Name.dirty(validNameString);

  const invalidLastNameString = 'invalid!';
  const invalidLastName = LastName.dirty(invalidNameString);

  const validLastNameString = 'lorenzo';
  const validLastName = LastName.dirty(validNameString);

  var invalidBirthDateDate = DateTime.parse('2010-01-01');
  var invalidBirtDate = BirthDate.dirty(invalidBirthDateDate);

  var validBirthDateDate = DateTime.parse('1980-01-01');
  var validBirtDate = BirthDate.dirty(validBirthDateDate);

  const invalidConfirmedPasswordString = 'invalid';
  const invalidConfirmedPassword = ConfirmedPassword.dirty(
    password: validPasswordString,
    value: invalidConfirmedPasswordString,
  );

  const validConfirmedPasswordString = 't0pS3cret1234!';
  const validConfirmedPassword = ConfirmedPassword.dirty(
    password: validPasswordString,
    value: validConfirmedPasswordString,
  );

  group('SignUpCubit', () {
    late AuthenticationRepository authenticationRepository;
    late UserRepository userRepository;
    late User user;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      userRepository = MockUserRepository();
      user = const User(id: '1', firstName: 'Lorenzo', lastName: 'Perez');
      when(
        () => authenticationRepository.signUp(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async {});
    });

    test('initial state is SignUpState', () {
      expect(SignUpCubit(authenticationRepository, userRepository).state,
          const SignUpState());
    });

    group('emailChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) => cubit.emailChanged(invalidEmailString),
        expect: () => const <SignUpState>[
          SignUpState(email: invalidEmail, status: FormzStatus.invalid),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when name/lastName/birthDay/email/password/confirmedPassword are valid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        seed: () => SignUpState(
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            name: validName,
            lastName: validLastName,
            birthDate: validBirtDate),
        act: (cubit) => cubit.emailChanged(validEmailString),
        expect: () => <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            name: validName,
            lastName: validLastName,
            birthDate: validBirtDate,
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('passwordChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) => cubit.passwordChanged(invalidPasswordString),
        expect: () => const <SignUpState>[
          SignUpState(
            confirmedPassword: ConfirmedPassword.dirty(
              password: invalidPasswordString,
            ),
            password: invalidPassword,
            status: FormzStatus.invalid,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when name/lastName/birthDate/email/password/confirmedPassword are valid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        seed: () => SignUpState(
          email: validEmail,
          confirmedPassword: validConfirmedPassword,
          name: validName,
          lastName: validLastName,
          birthDate: validBirtDate,
        ),
        act: (cubit) => cubit.passwordChanged(validPasswordString),
        expect: () => <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            name: validName,
            lastName: validLastName,
            birthDate: validBirtDate,
            status: FormzStatus.valid,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when confirmedPasswordChanged is called first and then '
        'passwordChanged is called',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        seed: () => SignUpState(
          email: validEmail,
          name: validName,
          lastName: validLastName,
          birthDate: validBirtDate,
        ),
        act: (cubit) => cubit
          ..confirmedPasswordChanged(validConfirmedPasswordString)
          ..passwordChanged(validPasswordString),
        expect: () => <SignUpState>[
          SignUpState(
            email: validEmail,
            confirmedPassword: validConfirmedPassword,
            status: FormzStatus.invalid,
            name: validName,
            lastName: validLastName,
            birthDate: validBirtDate,
          ),
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            status: FormzStatus.valid,
            name: validName,
            lastName: validLastName,
            birthDate: validBirtDate,
          ),
        ],
      );
    });

    group('confirmedPasswordChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when email/password/confirmedPassword are invalid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) {
          cubit.confirmedPasswordChanged(invalidConfirmedPasswordString);
        },
        expect: () => const <SignUpState>[
          SignUpState(
            confirmedPassword: invalidConfirmedPassword,
            status: FormzStatus.invalid,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when email/password/confirmedPassword are valid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        seed: () =>
            const SignUpState(email: validEmail, password: validPassword),
        act: (cubit) => cubit.confirmedPasswordChanged(
          validConfirmedPasswordString,
        ),
        expect: () => const <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            status: FormzStatus.valid,
          ),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when passwordChanged is called first and then '
        'confirmedPasswordChanged is called',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        seed: () => const SignUpState(email: validEmail),
        act: (cubit) => cubit
          ..passwordChanged(validPasswordString)
          ..confirmedPasswordChanged(validConfirmedPasswordString),
        expect: () => const <SignUpState>[
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: ConfirmedPassword.dirty(
              password: validPasswordString,
            ),
            status: FormzStatus.invalid,
          ),
          SignUpState(
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
            status: FormzStatus.valid,
          ),
        ],
      );
    });

    group('nameChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when name is invalid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) => cubit.nameChanged(invalidNameString),
        expect: () => const <SignUpState>[
          SignUpState(name: invalidName, status: FormzStatus.invalid),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when name is invalid and lastName,birthDate,sex, weight, height are valid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) => cubit.nameChanged(invalidNameString),
        seed: () => SignUpState(
          lastName: validLastName,
          birthDate: validBirtDate,
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
        ),
        expect: () => <SignUpState>[
          SignUpState(
              name: invalidName,
              lastName: validLastName,
              birthDate: validBirtDate,
              email: validEmail,
              password: validPassword,
              confirmedPassword: validConfirmedPassword,
              status: FormzStatus.invalid),
        ],
      );
      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when everything is valid.',
        build: () => SignUpCubit(
          authenticationRepository,
          userRepository,
        ),
        seed: () => SignUpState(
          lastName: validLastName,
          birthDate: validBirtDate,
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.nameChanged(validNameString),
        expect: () => <SignUpState>[
          SignUpState(
              lastName: validLastName,
              name: validName,
              birthDate: validBirtDate,
              email: validEmail,
              password: validPassword,
              confirmedPassword: validConfirmedPassword,
              status: FormzStatus.valid)
        ],
      );
    });

    group('lastNameChanged', () {
      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when lastName is invalid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) => cubit.lastNameChanged(invalidLastNameString),
        expect: () => const <SignUpState>[
          SignUpState(lastName: invalidLastName, status: FormzStatus.invalid),
        ],
      );

      blocTest<SignUpCubit, SignUpState>(
        'emits [invalid] when lastName is invalid and others are valid',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) => cubit.lastNameChanged(invalidNameString),
        seed: () => SignUpState(
          name: validName,
          birthDate: validBirtDate,
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
        ),
        expect: () => <SignUpState>[
          SignUpState(
              name: validName,
              lastName: invalidLastName,
              birthDate: validBirtDate,
              email: validEmail,
              password: validPassword,
              confirmedPassword: validConfirmedPassword,
              status: FormzStatus.invalid),
        ],
      );
      blocTest<SignUpCubit, SignUpState>(
        'emits [valid] when everything is valid.',
        build: () => SignUpCubit(
          authenticationRepository,
          userRepository,
        ),
        seed: () => SignUpState(
          name: validName,
          birthDate: validBirtDate,
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.lastNameChanged(validLastNameString),
        expect: () => <SignUpState>[
          SignUpState(
              lastName: validLastName,
              name: validName,
              birthDate: validBirtDate,
              email: validEmail,
              password: validPassword,
              confirmedPassword: validConfirmedPassword,
              status: FormzStatus.valid)
        ],
      );
    });

    group('signUpFormSubmitted', () {
      blocTest<SignUpCubit, SignUpState>(
        'does nothing when status is not validated',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        act: (cubit) => cubit.signUpFormSubmitted(),
        expect: () => const <SignUpState>[],
      );

      blocTest<SignUpCubit, SignUpState>(
        'calls signUp with correct email/password/confirmedPassword',
        build: () => SignUpCubit(authenticationRepository, userRepository),
        seed: () => const SignUpState(
          status: FormzStatus.valid,
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.signUpFormSubmitted(),
        verify: (_) {
          verify(
            () => authenticationRepository.signUp(
              email: validEmailString,
              password: validPasswordString,
            ),
          ).called(1);
        },
      );

      // blocTest<SignUpCubit, SignUpState>(
      //   'emits [submissionInProgress, submissionSuccess] '
      //   'when signUp succeeds',
      //   build: () => SignUpCubit(authenticationRepository, userRepository),
      //   seed: () => SignUpState(
      //       status: FormzStatus.valid,
      //       email: validEmail,
      //       password: validPassword,
      //       confirmedPassword: validConfirmedPassword,
      //       name: validName,
      //       lastName: validLastName,
      //       birthDate: validBirtDate,
      //       termsAccepted: true),
      //   act: (cubit) => cubit.signUpFormSubmitted(),
      //   expect: () => <SignUpState>[
      //     SignUpState(
      //         status: FormzStatus.submissionInProgress,
      //         email: validEmail,
      //         password: validPassword,
      //         confirmedPassword: validConfirmedPassword,
      //         name: validName,
      //         lastName: validLastName,
      //         birthDate: validBirtDate,
      //         termsAccepted: true),
      //     SignUpState(
      //         status: FormzStatus.submissionSuccess,
      //         email: validEmail,
      //         password: validPassword,
      //         confirmedPassword: validConfirmedPassword,
      //         name: validName,
      //         lastName: validLastName,
      //         birthDate: validBirtDate,
      //         termsAccepted: true)
      //   ],
      // );

      blocTest<SignUpCubit, SignUpState>(
        'emits [submissionInProgress, submissionFailure] '
        'when signUp fails',
        setUp: () {
          when(
            () => authenticationRepository.signUp(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => SignUpCubit(authenticationRepository, userRepository),
        seed: () => const SignUpState(
          status: FormzStatus.valid,
          email: validEmail,
          password: validPassword,
          confirmedPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.signUpFormSubmitted(),
        expect: () => const <SignUpState>[
          SignUpState(
            status: FormzStatus.submissionInProgress,
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
          ),
          SignUpState(
            status: FormzStatus.submissionFailure,
            email: validEmail,
            password: validPassword,
            confirmedPassword: validConfirmedPassword,
          )
        ],
      );
    });
  });
}
