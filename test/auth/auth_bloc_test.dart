// // ignore_for_file: prefer_const_constructors, must_be_immutable
// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:meddly/auth/bloc/auth_bloc.dart';
// import 'package:mocktail/mocktail.dart';

// class MockAuthenticationRepository extends Mock
//     implements AuthenticationRepository {}

// class MockUser extends Mock implements AuthUser {}

// void main() {
//   group('AuthBloc', () {
//     final user = MockUser();
//     late AuthenticationRepository authenticationRepository;

//     setUp(() {
//       authenticationRepository = MockAuthenticationRepository();
//       when(() => authenticationRepository.user).thenAnswer(
//         (_) => Stream.empty(),
//       );
//       when(
//         () => authenticationRepository.currentUser,
//       ).thenReturn(AuthUser.empty);
//     });

//     test('initial state is unauthenticated when user is empty', () {
//       expect(
//         AuthBloc(authenticationRepository: authenticationRepository).state,
//         AuthState.unauthenticated(),
//       );
//     });

//     group('UserChanged', () {
//       blocTest<AuthBloc, AuthState>(
//         'emits authenticated when user is not empty',
//         setUp: () {
//           when(() => user.isEmpty).thenReturn(false);
//           when(() => authenticationRepository.user).thenAnswer(
//             (_) => Stream.value(user),
//           );
//         },
//         build: () => AuthBloc(
//           authenticationRepository: authenticationRepository,
//         ),
//         seed: AuthState.unauthenticated,
//         expect: () => [AuthState.authenticated(user)],
//       );

//       blocTest<AuthBloc, AuthState>(
//         'emits unauthenticated when user is empty',
//         setUp: () {
//           when(() => authenticationRepository.user).thenAnswer(
//             (_) => Stream.value(AuthUser.empty),
//           );
//         },
//         build: () => AuthBloc(
//           authenticationRepository: authenticationRepository,
//         ),
//         expect: () => [AuthState.unauthenticated()],
//       );
//     });

//     group('LogoutRequested', () {
//       blocTest<AuthBloc, AuthState>(
//         'invokes logOut',
//         setUp: () {
//           when(
//             () => authenticationRepository.logOut(),
//           ).thenAnswer((_) async {});
//         },
//         build: () => AuthBloc(
//           authenticationRepository: authenticationRepository,
//         ),
//         act: (bloc) => bloc.add(AuthLogoutRequestedEvent()),
//         verify: (_) {
//           verify(() => authenticationRepository.logOut()).called(1);
//         },
//       );
//     });
//   });
// }
