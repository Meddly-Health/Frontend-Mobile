import 'dart:async';
import 'package:authentication_repository/authentication_repository.dart'
    as auth;
import 'package:bloc/bloc.dart';
import 'package:meddly/user/api/user_api.dart';
import 'package:meddly/user/models/user.dart';
import 'package:meddly/user/repository/respository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final auth.AuthenticationRepository authenticationRepository;

  UserBloc(this.userRepository, this.authenticationRepository)
      : super(const UserState()) {
    on<UserLoading>(_onUserLoading);

    on<UserDelete>(_onUserDelete);

    on<UserUpdate>(_onUserUpdate);
  }

  FutureOr<void> _onUserUpdate(
      UserUpdate event, Emitter<UserState> emit) async {
    if (state.currentUser == null) {
      return;
    }

    emit(state.copyWith(status: UserStatus.loading));

    // Create a new user ...

    var response = await userRepository
        .updateUser(state.currentUser!.copyWith(lastName: 'updated'));

    response.fold(
      (error) => emit(state.copyWith(
          status: UserStatus.error, errorMessage: error.message)),
      (user) =>
          emit(state.copyWith(status: UserStatus.success, currentUser: user)),
    );
  }

  FutureOr<void> _onUserDelete(
      UserDelete event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));

    var response = await userRepository
        .deleteUser(authenticationRepository.currentUser.id);

    response.fold(
      (UserException l) => emit(
          state.copyWith(status: UserStatus.error, errorMessage: l.message)),
      (User r) => emit(state.copyWith(status: UserStatus.success)),
    );
  }

  FutureOr<void> _onUserLoading(
      UserLoading event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));

    var response =
        await userRepository.getUser(authenticationRepository.currentUser.id);

    response.fold(
      (UserException l) => emit(
          state.copyWith(status: UserStatus.error, errorMessage: l.message)),
      (User r) =>
          emit(state.copyWith(status: UserStatus.success, currentUser: r)),
    );
  }
}
