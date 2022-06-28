// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:form_helper/form_helper.dart';
// import 'package:formz/formz.dart';
// import 'package:meddly/blocs.dart';

// import 'package:mocktail/mocktail.dart';
// import 'package:user_repository/user_repository.dart';

// class MockAuthenticationRepository extends Mock
//     implements AuthenticationRepository {}

// class MockUserRepository extends Mock implements UserRepository {}

// class MockUser extends Mock implements User {}

// void main() {
//   const invalidNameString = 'invalid!';
//   const invalidName = Name.dirty(invalidNameString);

//   const validNameString = 'lorenzo';
//   const validName = Name.dirty(validNameString);

//   const invalidLastNameString = 'invalid!';
//   const invalidLastName = LastName.dirty(invalidNameString);

//   const validLastNameString = 'lorenzo';
//   const validLastName = LastName.dirty(validNameString);

//   var invalidBirthDateDate = DateTime.parse('2010-01-01');
//   var invalidBirtDate = BirthDate.dirty(invalidBirthDateDate);

//   var validBirthDateDate = DateTime.parse('1980-01-01');
//   var validBirtDate = BirthDate.dirty(validBirthDateDate);

//   const invalidHeightValue = -3;
//   const invalidHeight = Heigth.dirty(invalidHeightValue);

//   const validHeightValue = 170;
//   const validHeight = Heigth.dirty(validHeightValue);

//   const invalidWeightValue = -3.0;
//   const invalidWeight = Weight.dirty(invalidWeightValue);

//   const validWeightValue = 50.0;
//   const validWeight = Weight.dirty(validWeightValue);

//   const validSex = Sex.masculino;

//   group('SetupCubit', () {
//     late UserRepository userRepository;
//     late AuthenticationRepository authenticationRepository;
//     late User user;

//     setUp(() {
//       authenticationRepository = MockAuthenticationRepository();
//       userRepository = MockUserRepository();
//       user = MockUser();
//     });

//     group('lastNameChanged', () {
//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when name is invalid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.lastNameChanged(invalidLastNameString),
//         expect: () => const <SetupState>[
//           SetupState(lastName: invalidLastName, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when lastName is invalid and name,birthDate,sex, weight, height are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.lastNameChanged(invalidLastNameString),
//         seed: () => SetupState(
//           birthDate: validBirtDate,
//           name: validName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: invalidLastName,
//               birthDate: validBirtDate,
//               name: validName,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.invalid),
//         ],
//       );
//       blocTest<SetupCubit, SetupState>(
//         'emits [valid] when lastName is valid and name,birthDate,sex,weight,height are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         seed: () => SetupState(
//           birthDate: validBirtDate,
//           name: validName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         act: (cubit) => cubit.lastNameChanged(validLastNameString),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: validLastName,
//               name: validName,
//               birthDate: validBirtDate,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.valid)
//         ],
//       );
//     });

//     group('sexChanged', () {
//       blocTest<SetupCubit, SetupState>('changes when sex is selected',
//           act: (cubit) => cubit.sexChanged(validSex),
//           build: () => SetupCubit(userRepository, authenticationRepository),
//           expect: () => <SetupState>[const SetupState(sex: validSex)]);
//     });

//     group('birthDateChanged', () {
//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when birthdate is invalid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.birthDateChanged(invalidBirthDateDate),
//         expect: () => <SetupState>[
//           SetupState(birthDate: invalidBirtDate, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when birthdate is invalid and name,lastName,sex, weight, height are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.birthDateChanged(invalidBirthDateDate),
//         seed: () => const SetupState(
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: validLastName,
//               birthDate: invalidBirtDate,
//               name: validName,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<SetupCubit, SetupState>(
//         'emits [valid] when birthdate is valid and name,lastName,sex, weight, height are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.birthDateChanged(validBirthDateDate),
//         seed: () => const SetupState(
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: validLastName,
//               birthDate: validBirtDate,
//               name: validName,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.valid),
//         ],
//       );
//     });

//     group('weightChanged', () {
//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when weight is invalid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.weightChanged(invalidWeightValue),
//         expect: () => const <SetupState>[
//           SetupState(weight: invalidWeight, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when weight is invalid and name,lastname,birthDate,sex,height are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.weightChanged(invalidWeightValue),
//         seed: () => SetupState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//         ),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: validLastName,
//               birthDate: validBirtDate,
//               name: validName,
//               sex: validSex,
//               height: validHeight,
//               weight: invalidWeight,
//               status: FormzStatus.invalid),
//         ],
//       );
//       blocTest<SetupCubit, SetupState>(
//         'emits [valid] when weight is valid and name,lastName,birthDate,sex,height are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         seed: () => SetupState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//         ),
//         act: (cubit) => cubit.weightChanged(validWeightValue),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: validLastName,
//               name: validName,
//               birthDate: validBirtDate,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.valid)
//         ],
//       );
//     });
//     group('heightChanged', () {
//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when height is invalid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.heightChanged(invalidHeightValue),
//         expect: () => const <SetupState>[
//           SetupState(height: invalidHeight, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<SetupCubit, SetupState>(
//         'emits [invalid] when height is invalid and name,lastname,birthDate,sex,weight are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         act: (cubit) => cubit.heightChanged(invalidHeightValue),
//         seed: () => SetupState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           weight: validWeight,
//         ),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: validLastName,
//               birthDate: validBirtDate,
//               name: validName,
//               sex: validSex,
//               height: invalidHeight,
//               weight: validWeight,
//               status: FormzStatus.invalid),
//         ],
//       );
//       blocTest<SetupCubit, SetupState>(
//         'emits [valid] when height is valid and name,lastName,birthDate,sex,weight are valid',
//         build: () => SetupCubit(userRepository, authenticationRepository),
//         seed: () => SetupState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           weight: validWeight,
//         ),
//         act: (cubit) => cubit.heightChanged(validHeightValue),
//         expect: () => <SetupState>[
//           SetupState(
//               lastName: validLastName,
//               name: validName,
//               birthDate: validBirtDate,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.valid)
//         ],
//       );
//     });

//     group('save', () {
//       blocTest<SetupCubit, SetupState>(
//           'emits [submissionInProgress][submissionSuccess] when form is successful.',
//           setUp: () {
//             registerFallbackValue(user);
//             when(() => userRepository.updateUser(any()))
//                 .thenAnswer((_) async => Right(user));
//           },
//           seed: () => SetupState(
//                 birthDate: validBirtDate,
//                 name: validName,
//                 lastName: validLastName,
//                 sex: validSex,
//                 height: validHeight,
//                 weight: validWeight,
//               ),
//           build: () => SetupCubit(userRepository, authenticationRepository),
//           act: (cubit) => cubit.saveUserData(),
//           expect: () => <SetupState>[
//                 SetupState(
//                     birthDate: validBirtDate,
//                     name: validName,
//                     lastName: validLastName,
//                     sex: validSex,
//                     height: validHeight,
//                     weight: validWeight,
//                     status: FormzStatus.submissionInProgress),
//                 SetupState(
//                     birthDate: validBirtDate,
//                     name: validName,
//                     lastName: validLastName,
//                     sex: validSex,
//                     height: validHeight,
//                     weight: validWeight,
//                     status: FormzStatus.submissionSuccess)
//               ]);

//       blocTest<SetupCubit, SetupState>(
//           'emits [submissionInProgress][submissionFailure] when form failed.',
//           setUp: () {
//             registerFallbackValue(user);
//             when(() => userRepository.updateUser(any()))
//                 .thenAnswer((_) async => Left(UserException(message: 'ops!')));
//           },
//           seed: () => SetupState(
//                 birthDate: validBirtDate,
//                 name: validName,
//                 lastName: validLastName,
//                 sex: validSex,
//                 height: validHeight,
//                 weight: validWeight,
//               ),
//           build: () => SetupCubit(userRepository, authenticationRepository),
//           act: (cubit) => cubit.saveUserData(),
//           expect: () => <SetupState>[
//                 SetupState(
//                     birthDate: validBirtDate,
//                     name: validName,
//                     lastName: validLastName,
//                     sex: validSex,
//                     height: validHeight,
//                     weight: validWeight,
//                     status: FormzStatus.submissionInProgress),
//                 SetupState(
//                     birthDate: validBirtDate,
//                     name: validName,
//                     lastName: validLastName,
//                     sex: validSex,
//                     height: validHeight,
//                     weight: validWeight,
//                     errorMessage: 'ops!',
//                     status: FormzStatus.submissionFailure)
//               ]);
//     });
//   });
// }
