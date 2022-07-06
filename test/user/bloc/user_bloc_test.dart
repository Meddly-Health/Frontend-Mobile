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
    late User supervising;

    setUp(() {
      userRepository = MockUserRepository();
      authenticationRepository = MockAuthenticationRepository();
      user = const User(id: '1', firstName: 'Lorenzo', lastName: 'Perez');
      userUpdated = const User(id: '2', firstName: 'Lorenzo', lastName: 'Sala');
      authUser = MockAuthUser();
      supervising = const User(id: '2', firstName: 'Ignacio');
    });
    group('update', () {
      blocTest<UserBloc, UserState>(
        'emits [loading, success] when user is updated',
        build: () => UserBloc(userRepository, authenticationRepository),
        seed: () => UserState.success(currentUser: user),
        setUp: () {
          registerFallbackValue(user);
          when(() => userRepository.updateUser(any()))
              .thenAnswer((_) async => Right(userUpdated));
        },
        act: (bloc) => bloc.add(UserEvent.updateUser(userUpdated)),
        expect: () => <UserState>[
          const UserState.loading(),
          UserState.success(currentUser: userUpdated),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [loading, error] when user is not updated',
        build: () => UserBloc(userRepository, authenticationRepository),
        setUp: () {
          registerFallbackValue(user);
          when(() => userRepository.updateUser(any()))
              .thenAnswer((_) async => Left(UserException(message: 'ops!')));
        },
        act: (bloc) => bloc.add(UserEvent.updateUser(userUpdated)),
        expect: () => <UserState>[
          const UserState.loading(),
          const UserState.error('ops!'),
        ],
      );
    });

    group('delete', () {
      blocTest<UserBloc, UserState>(
          'emits [loading, success] when user is deleted',
          build: () => UserBloc(userRepository, authenticationRepository),
          seed: () => UserState.success(currentUser: user),
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
          act: (bloc) => bloc.add(const DeleteUser()),
          expect: () => <UserState>[
                const UserState.loading(),
                UserState.success(currentUser: user),
              ]);

      blocTest<UserBloc, UserState>(
          'emits [loading, error] when user is deleted',
          build: () => UserBloc(userRepository, authenticationRepository),
          seed: () => UserState.success(currentUser: user),
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
          act: (bloc) => bloc.add(const DeleteUser()),
          expect: () => <UserState>[
                const UserState.loading(),
                const UserState.error('ops!'),
              ]);
    });

    group('load', () {
      blocTest<UserBloc, UserState>(
        'emits [loading, success] when user is added',
        build: () => UserBloc(userRepository, authenticationRepository),
        setUp: () {
          when(() => authUser.id).thenAnswer((_) => 'id');
          when(() => authenticationRepository.currentUser)
              .thenAnswer((_) => authUser);
          registerFallbackValue(user);
          when(() => userRepository.getUser(any()))
              .thenAnswer((_) async => Right(user));
        },
        act: (bloc) => bloc.add(const GetUser()),
        expect: () => <UserState>[
          const UserState.loading(),
          UserState.success(currentUser: user),
        ],
      );

      blocTest<UserBloc, UserState>(
        'emits [loading, error] when user is not not added',
        build: () => UserBloc(userRepository, authenticationRepository),
        setUp: () {
          when(() => authUser.id).thenAnswer((_) => 'id');
          when(() => authenticationRepository.currentUser)
              .thenAnswer((_) => authUser);
          registerFallbackValue(user);
          when(() => userRepository.getUser(any()))
              .thenAnswer((_) async => Left(UserException(message: 'ops!')));
        },
        act: (bloc) => bloc.add(const GetUser()),
        expect: () => <UserState>[
          const UserState.loading(),
          const UserState.error('ops!'),
        ],
      );

      blocTest<UserBloc, UserState>(
          'emits [loading,success] when supervising is changed and is not null',
          build: () => UserBloc(userRepository, authenticationRepository),
          seed: () => UserState.success(currentUser: user),
          act: (bloc) => bloc.add(ChangeSupervisor(supervising)),
          expect: () => <UserState>[
                UserState.success(currentUser: user, supervising: supervising)
              ]);

      blocTest<UserBloc, UserState>(
          'emits [loading,success] when supervising is changed and is null',
          build: () => UserBloc(userRepository, authenticationRepository),
          seed: () =>
              UserState.success(currentUser: user, supervising: supervising),
          act: (bloc) => bloc.add(const ChangeSupervisor(null)),
          expect: () => <UserState>[UserState.success(currentUser: user)]);
    });
  });
}
