import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meddly/user/bloc/user_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthUser extends Mock implements AuthUser {}

void main() {
  group('UserBloc', () {
    late UserRepository userRepository;
    late AuthenticationRepository authenticationRepository;
    late User user;
    late User userUpdated;
    late AuthUser authUser;

    setUp(() {
      userRepository = MockUserRepository();
      authenticationRepository = MockAuthenticationRepository();
      user = const User(firstName: 'Lorenzo', lastName: 'Perez');
      userUpdated = const User(firstName: 'Lorenzo', lastName: 'Sala');
      authUser = MockAuthUser();
    });
    group('update', () {
      blocTest<UserBloc, UserState>(
        'emits [loading, success] when user is updated',
        build: () => UserBloc(userRepository, authenticationRepository),
        seed: () => UserState(currentUser: user),
        setUp: () {
          registerFallbackValue(user);
          when(() => userRepository.updateUser(any()))
              .thenAnswer((_) async => Right(userUpdated));
        },
        act: (bloc) => bloc.add(UserUpdate(user: userUpdated)),
        expect: () => <UserState>[
          UserState(status: UserStatus.loading, currentUser: user),
          UserState(status: UserStatus.success, currentUser: userUpdated),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [loagin, error] when user is not updated',
        build: () => UserBloc(userRepository, authenticationRepository),
        seed: () => UserState(currentUser: user),
        setUp: () {
          registerFallbackValue(user);
          when(() => userRepository.updateUser(any()))
              .thenAnswer((_) async => Left(UserException(message: 'ops!')));
        },
        act: (bloc) => bloc.add(UserUpdate(user: userUpdated)),
        expect: () => <UserState>[
          UserState(status: UserStatus.loading, currentUser: user),
          UserState(
              status: UserStatus.error,
              currentUser: user,
              errorMessage: 'ops!'),
        ],
      );
    });

    group('delete', () {
      blocTest<UserBloc, UserState>(
          'emits [loading, success] when user is deleted',
          build: () => UserBloc(userRepository, authenticationRepository),
          seed: () => UserState(currentUser: user),
          setUp: () {
            when(() => authUser.id).thenAnswer((_) => 'id');
            when(() => authenticationRepository.currentUser)
                .thenAnswer((_) => authUser);
            when(() => userRepository.deleteUser(any()))
                .thenAnswer((_) async => Right(user));
            when(() => authenticationRepository.currentUser)
                .thenAnswer((_) => authUser);
            registerFallbackValue(user);
            when(() => userRepository.deleteUser(any<String>()))
                .thenAnswer((_) async => Right(user));
          },
          act: (bloc) => bloc.add(UserDelete()),
          expect: () => <UserState>[
                UserState(status: UserStatus.loading, currentUser: user),
                UserState(status: UserStatus.success, currentUser: user),
              ]);

      blocTest<UserBloc, UserState>(
          'emits [loading, error] when user is deleted',
          build: () => UserBloc(userRepository, authenticationRepository),
          seed: () => UserState(currentUser: user),
          setUp: () {
            when(() => authUser.id).thenAnswer((_) => 'id');
            when(() => authenticationRepository.currentUser)
                .thenAnswer((_) => authUser);
            registerFallbackValue(user);
            when(() => userRepository.deleteUser(any()))
                .thenAnswer((_) async => Left(UserException(message: 'ops!')));
            when(() => authenticationRepository.currentUser)
                .thenAnswer((_) => authUser);
          },
          act: (bloc) => bloc.add(UserDelete()),
          expect: () => <UserState>[
                UserState(status: UserStatus.loading, currentUser: user),
                UserState(
                    status: UserStatus.error,
                    currentUser: user,
                    errorMessage: 'ops!'),
              ]);
    });

    group('load', () {
      blocTest<UserBloc, UserState>(
        'emits [loading, success] when user is deleted',
        build: () => UserBloc(userRepository, authenticationRepository),
        setUp: () {
          when(() => authUser.id).thenAnswer((_) => 'id');
          when(() => authenticationRepository.currentUser)
              .thenAnswer((_) => authUser);
          registerFallbackValue(user);
          when(() => userRepository.getUser(any()))
              .thenAnswer((_) async => Right(user));
        },
        act: (bloc) => bloc.add(UserGet()),
        expect: () => <UserState>[
          const UserState(status: UserStatus.loading),
          UserState(status: UserStatus.success, currentUser: user),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [loading, error] when user is not deleted',
        build: () => UserBloc(userRepository, authenticationRepository),
        setUp: () {
          when(() => authUser.id).thenAnswer((_) => 'id');
          when(() => authenticationRepository.currentUser)
              .thenAnswer((_) => authUser);
          registerFallbackValue(user);
          when(() => userRepository.getUser(any()))
              .thenAnswer((_) async => Left(UserException(message: 'ops!')));
        },
        act: (bloc) => bloc.add(UserGet()),
        expect: () => <UserState>[
          const UserState(status: UserStatus.loading),
          const UserState(status: UserStatus.error, errorMessage: 'ops!'),
        ],
      );
    });
  });
}
