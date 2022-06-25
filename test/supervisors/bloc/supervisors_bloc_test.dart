// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:meddly/supervisors/bloc/supervisors_bloc.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:user_repository/user_repository.dart';

// class MockAuthenticationRepository extends Mock
//     implements AuthenticationRepository {}

// class MockUserRepository extends Mock implements UserRepository {}

// class MockUser extends Mock implements User {}

// class MockAuthUser extends Mock implements AuthUser {}

// void main() {
//   group('SupervisorsBloc', () {
//     late AuthUser authUser;
//     late AuthenticationRepository authenticationRepository;
//     late UserRepository userRepository;
//     const code = '123';
//     const String errorMessage = 'ops!';

//     const user = User(id: '1', firstName: 'John', lastName: 'Doe');

//     setUp(() {
//       authUser = MockAuthUser();
//       authenticationRepository = MockAuthenticationRepository();
//       userRepository = MockUserRepository();
//     });

//     test('initial state is empty status initial ', () {
//       expect(
//           SupervisorsBloc(
//             userRepository: userRepository,
//             authenticationRepository: authenticationRepository,
//           ).state,
//           const SupervisorsState());
//     });

//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, success] when supervisors are loaded',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => authUser.id).thenAnswer((_) => 'id');
//           when(() => authenticationRepository.currentUser)
//               .thenAnswer((_) => authUser);
//           registerFallbackValue(user);
//           when(() => userRepository.getUser(any()))
//               .thenAnswer((_) async => const Right(user));
//         },
//         act: (bloc) => bloc.add(const GetSupervisors()),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(status: SupervisorsStatus.success),
//             ]);
//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, error] when supervisors are not loaded',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => authUser.id).thenAnswer((_) => 'id');
//           when(() => authenticationRepository.currentUser)
//               .thenAnswer((_) => authUser);
//           registerFallbackValue(user);
//           when(() => userRepository.getUser(any())).thenAnswer(
//               (_) async => Left(UserException(message: errorMessage)));
//         },
//         act: (bloc) => bloc.add(const GetSupervisors()),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(
//                   status: SupervisorsStatus.error, errorMessage: errorMessage),
//             ]);

//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, added] when a supervised is added',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => userRepository.acceptInvitation(code))
//               .thenAnswer((_) async => const Right(Nothing()));
//         },
//         act: (bloc) => bloc.add(const AddSupervised(code)),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(status: SupervisorsStatus.added),
//             ]);
//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, error] when a supervised is not added',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => userRepository.acceptInvitation(code)).thenAnswer(
//               (_) async => Left(UserException(message: errorMessage)));
//         },
//         act: (bloc) => bloc.add(const AddSupervised(code)),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(
//                   status: SupervisorsStatus.error, errorMessage: errorMessage),
//             ]);

//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, deleted] when a supervised is deleted',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => userRepository.deleteSupervised('1'))
//               .thenAnswer((_) async => const Right(Nothing()));
//         },
//         act: (bloc) => bloc.add(const DeleteSupervised('1')),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(status: SupervisorsStatus.deleted),
//             ]);

//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, error] when a supervised is not deleted',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => userRepository.deleteSupervised('1')).thenAnswer(
//               (_) async => Left(UserException(message: errorMessage)));
//         },
//         act: (bloc) => bloc.add(const DeleteSupervised('1')),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(
//                   status: SupervisorsStatus.error, errorMessage: errorMessage),
//             ]);

//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, error] when a supervisor is not deleted',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => userRepository.deleteSupervisor('1')).thenAnswer(
//               (_) async => Left(UserException(message: errorMessage)));
//         },
//         act: (bloc) => bloc.add(const DeleteSupervisor('1')),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(
//                   status: SupervisorsStatus.error, errorMessage: errorMessage),
//             ]);
//     blocTest<SupervisorsBloc, SupervisorsState>(
//         'emit [loading, deleted] when a supervisor is deleted',
//         build: (() => SupervisorsBloc(
//               userRepository: userRepository,
//               authenticationRepository: authenticationRepository,
//             )),
//         setUp: () {
//           when(() => userRepository.deleteSupervisor('1'))
//               .thenAnswer((_) async => const Right(Nothing()));
//         },
//         act: (bloc) => bloc.add(const DeleteSupervisor('1')),
//         expect: () => [
//               const SupervisorsState(status: SupervisorsStatus.loading),
//               const SupervisorsState(status: SupervisorsStatus.deleted),
//             ]);
//   });
// }
