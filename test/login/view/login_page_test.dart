// // ignore_for_file: prefer_const_constructors
// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:meddly/blocs.dart';
// import 'package:mocktail/mocktail.dart';

// class MockAuthenticationRepository extends Mock
//     implements AuthenticationRepository {}

// class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

// class MockUser extends Mock implements User {}

// class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

// void main() {
//   const createAccountButtonKey = Key('signUpTextButton');

//   late AuthBloc authBloc;
//   late LoginCubit loginCubit;
//   late User user;
//   late AuthenticationRepository authenticationRepository;

//   setUp(() {
//     loginCubit = MockLoginCubit();
//     authBloc = MockAuthBloc();
//     user = MockUser();
//     authenticationRepository = MockAuthenticationRepository();
//   });

//   group('LoginPage', () {
//     group('render', () {
//       Widget createLoginPage() {
//         return RepositoryProvider.value(
//           value: authenticationRepository,
//           child: MultiBlocProvider(
//             providers: [
//               BlocProvider(create: (_) => authBloc),
//               BlocProvider(create: (_) => loginCubit),
//             ],
//             child: MaterialApp(
//                 routes: {'/signup': (_) => SignUpPage()},
//                 home: const LoginPage()),
//           ),
//         );
//       }

//       testWidgets('renders a LoginForm', (tester) async {
//         when(() => authBloc.state)
//             .thenReturn(const AuthState.unauthenticated());
//         await tester.pumpWidget(createLoginPage());
//         expect(find.byType(LoginForm), findsOneWidget);
//       });
//     });
//     group('navigates', () {
//       Widget createLoginPage() {
//         return RepositoryProvider.value(
//           value: authenticationRepository,
//           child: BlocProvider.value(
//             value: authBloc,
//             child: MaterialApp(
//               initialRoute: '/login',
//               routes: {
//                 '/login': (_) => LoginPage(),
//                 '/signup': (_) => SignUpPage(),
//                 '/': (_) => MainPage()
//               },
//             ),
//           ),
//         );
//       }

//       testWidgets('to SignUpPage when Create Account is pressed',
//           (tester) async {
//         when(() => authBloc.state)
//             .thenReturn(const AuthState.unauthenticated());
//         await tester.pumpWidget(createLoginPage());
//         await tester.ensureVisible(find.byKey(createAccountButtonKey));
//         await tester.tap(find.byKey(createAccountButtonKey));
//         await tester.pumpAndSettle();

//         expect(find.byType(SignUpPage), findsOneWidget);
//       });
//     });
//   });
// }
