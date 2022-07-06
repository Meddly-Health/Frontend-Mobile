import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart'
    as auth;
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final auth.AuthenticationRepository authenticationRepository;

  UserBloc(this.userRepository, this.authenticationRepository)
      : super(const UserState.initial()) {
    on<GetUser>(_onGetUser);

    on<DeleteUser>(_onUserDelete);

    on<UpdateUser>(_onUserUpdate);

    on<ChangeSupervisor>(_onUserChangedSupervisor);

    on<Logout>(_onLogout);
  }

  FutureOr<void> _onLogout(Logout event, Emitter<UserState> emit) async {
    emit(const UserState.loading());
    await authenticationRepository.logOut();
    emit(const UserState.success(currentUser: null));
  }

  FutureOr<void> _onUserUpdate(
      UpdateUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());

    var response = await userRepository.updateUser(event.user);

    response.fold(
      (e) => emit(UserState.error(e.message)),
      (user) => emit(UserState.success(currentUser: user)),
    );
  }

  FutureOr<void> _onUserDelete(
      DeleteUser event, Emitter<UserState> emit) async {
    emit(const UserState.loading());

    var response = await userRepository
        .deleteUser(authenticationRepository.currentUser.id);

    response.fold(
      (UserException e) => emit(UserState.error(e.message)),
      (User user) => emit(UserState.success(currentUser: user)),
    );
  }

  FutureOr<void> _onGetUser(GetUser event, Emitter<UserState> emit) async {
    if (authenticationRepository.currentUser.id != '') {
      emit(const UserState.loading());
      var response =
          await userRepository.getUser(authenticationRepository.currentUser.id);

      response.fold(
        (UserException e) => emit(UserState.error(e.message)),
        (User user) => emit(UserState.success(currentUser: user)),
      );
    }
  }

  FutureOr<void> _onUserChangedSupervisor(
      ChangeSupervisor event, Emitter<UserState> emit) async {
    state.maybeMap(
        orElse: () {},
        success: (state) => emit(state.copyWith(supervising: event.user)));
  }
}
