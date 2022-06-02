// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:form_helper/form_helper.dart';
// import 'package:formz/formz.dart';
// import 'package:meddly/blocs.dart';
// import 'package:meddly/user/api/api.dart';
// import 'package:meddly/user/models/models.dart';
// import 'package:meddly/user/repository/respository.dart';
// import 'package:mocktail/mocktail.dart';

// TODO: Add tests for the following:

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

//   const invalidSex = 'invalid';
//   const validSex = Sex.masculino;

//   group('UserFormCubit', () {
//     late UserRepository userRepository;
//     late AuthenticationRepository authenticationRepository;
//     late User user;

//     setUp(() {
//       authenticationRepository = MockAuthenticationRepository();
//       userRepository = MockUserRepository();
//       user = MockUser();
//     });

//     group('nameChanged', () {
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when name is invalid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.nameChanged(invalidNameString),
//         expect: () => const <UserFormState>[
//           UserFormState(name: invalidName, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when name is invalid and lastName,birthDate,sex, weight, height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.nameChanged(invalidNameString),
//         seed: () => UserFormState(
//           lastName: validLastName,
//           birthDate: validBirtDate,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         expect: () => <UserFormState>[
//           UserFormState(
//               lastName: validLastName,
//               birthDate: validBirtDate,
//               sex: validSex,
//               name: invalidName,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.invalid),
//         ],
//       );
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [valid] when name is valid and name,birthDate,sex,weight,height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         seed: () => UserFormState(
//           lastName: validLastName,
//           birthDate: validBirtDate,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         act: (cubit) => cubit.nameChanged(validNameString),
//         expect: () => <UserFormState>[
//           UserFormState(
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

//     group('lastNameChanged', () {
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when name is invalid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.lastNameChanged(invalidLastNameString),
//         expect: () => const <UserFormState>[
//           UserFormState(lastName: invalidLastName, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when lastName is invalid and name,birthDate,sex, weight, height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.lastNameChanged(invalidLastNameString),
//         seed: () => UserFormState(
//           birthDate: validBirtDate,
//           name: validName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         expect: () => <UserFormState>[
//           UserFormState(
//               lastName: invalidLastName,
//               birthDate: validBirtDate,
//               name: validName,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.invalid),
//         ],
//       );
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [valid] when lastName is valid and name,birthDate,sex,weight,height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         seed: () => UserFormState(
//           birthDate: validBirtDate,
//           name: validName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         act: (cubit) => cubit.lastNameChanged(validLastNameString),
//         expect: () => <UserFormState>[
//           UserFormState(
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
//       blocTest<UserFormCubit, UserFormState>('changes when sex is selected',
//           act: (cubit) => cubit.sexChanged(validSex),
//           build: () => UserFormCubit(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository),
//           expect: () => <UserFormState>[const UserFormState(sex: validSex)]);
//     });

//     group('birthDateChanged', () {
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when birthdate is invalid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.birthDateChanged(invalidBirthDateDate),
//         expect: () => <UserFormState>[
//           UserFormState(
//               birthDate: invalidBirtDate, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when birthdate is invalid and name,lastName,sex, weight, height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.birthDateChanged(invalidBirthDateDate),
//         seed: () => const UserFormState(
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         expect: () => <UserFormState>[
//           UserFormState(
//               lastName: validLastName,
//               birthDate: invalidBirtDate,
//               name: validName,
//               sex: validSex,
//               height: validHeight,
//               weight: validWeight,
//               status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<UserFormCubit, UserFormState>(
//         'emits [valid] when birthdate is valid and name,lastName,sex, weight, height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.birthDateChanged(validBirthDateDate),
//         seed: () => const UserFormState(
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//           weight: validWeight,
//         ),
//         expect: () => <UserFormState>[
//           UserFormState(
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
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when weight is invalid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.weightChanged(invalidWeightValue),
//         expect: () => const <UserFormState>[
//           UserFormState(weight: invalidWeight, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when weight is invalid and name,lastname,birthDate,sex,height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.weightChanged(invalidWeightValue),
//         seed: () => UserFormState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//         ),
//         expect: () => <UserFormState>[
//           UserFormState(
//               lastName: validLastName,
//               birthDate: validBirtDate,
//               name: validName,
//               sex: validSex,
//               height: validHeight,
//               weight: invalidWeight,
//               status: FormzStatus.invalid),
//         ],
//       );
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [valid] when weight is valid and name,lastName,birthDate,sex,height are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         seed: () => UserFormState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           height: validHeight,
//         ),
//         act: (cubit) => cubit.weightChanged(validWeightValue),
//         expect: () => <UserFormState>[
//           UserFormState(
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
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when height is invalid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.heightChanged(invalidHeightValue),
//         expect: () => const <UserFormState>[
//           UserFormState(height: invalidHeight, status: FormzStatus.invalid),
//         ],
//       );

//       blocTest<UserFormCubit, UserFormState>(
//         'emits [invalid] when height is invalid and name,lastname,birthDate,sex,weight are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         act: (cubit) => cubit.heightChanged(invalidHeightValue),
//         seed: () => UserFormState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           weight: validWeight,
//         ),
//         expect: () => <UserFormState>[
//           UserFormState(
//               lastName: validLastName,
//               birthDate: validBirtDate,
//               name: validName,
//               sex: validSex,
//               height: invalidHeight,
//               weight: validWeight,
//               status: FormzStatus.invalid),
//         ],
//       );
//       blocTest<UserFormCubit, UserFormState>(
//         'emits [valid] when height is valid and name,lastName,birthDate,sex,weight are valid',
//         build: () => UserFormCubit(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository),
//         seed: () => UserFormState(
//           birthDate: validBirtDate,
//           name: validName,
//           lastName: validLastName,
//           sex: validSex,
//           weight: validWeight,
//         ),
//         act: (cubit) => cubit.heightChanged(validHeightValue),
//         expect: () => <UserFormState>[
//           UserFormState(
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
//       blocTest<UserFormCubit, UserFormState>(
//           'emits [submissionInProgress][submissionSuccess] when form is successful.',
//           setUp: () {
//             registerFallbackValue(user);
//             when(() => userRepository.updateUser(any()))
//                 .thenAnswer((_) async => Right(user));
//           },
//           seed: () => UserFormState(
//                 birthDate: validBirtDate,
//                 name: validName,
//                 lastName: validLastName,
//                 sex: validSex,
//                 height: validHeight,
//                 weight: validWeight,
//               ),
//           build: () => UserFormCubit(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository),
//           act: (cubit) => cubit.saveUserData(),
//           expect: () => <UserFormState>[
//                 UserFormState(
//                     birthDate: validBirtDate,
//                     name: validName,
//                     lastName: validLastName,
//                     sex: validSex,
//                     height: validHeight,
//                     weight: validWeight,
//                     status: FormzStatus.submissionInProgress),
//                 UserFormState(
//                     birthDate: validBirtDate,
//                     name: validName,
//                     lastName: validLastName,
//                     sex: validSex,
//                     height: validHeight,
//                     weight: validWeight,
//                     status: FormzStatus.submissionSuccess)
//               ]);

//       blocTest<UserFormCubit, UserFormState>(
//           'emits [submissionInProgress][submissionFailure] when form failed.',
//           setUp: () {
//             registerFallbackValue(user);
//             when(() => userRepository.updateUser(any()))
//                 .thenAnswer((_) async => Left(UserException(message: 'ops!')));
//           },
//           seed: () => UserFormState(
//                 birthDate: validBirtDate,
//                 name: validName,
//                 lastName: validLastName,
//                 sex: validSex,
//                 height: validHeight,
//                 weight: validWeight,
//               ),
//           build: () => UserFormCubit(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository),
//           act: (cubit) => cubit.saveUserData(),
//           expect: () => <UserFormState>[
//                 UserFormState(
//                     birthDate: validBirtDate,
//                     name: validName,
//                     lastName: validLastName,
//                     sex: validSex,
//                     height: validHeight,
//                     weight: validWeight,
//                     status: FormzStatus.submissionInProgress),
//                 UserFormState(
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
