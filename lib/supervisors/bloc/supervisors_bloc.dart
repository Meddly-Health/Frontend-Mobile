import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_repository/user_repository.dart';

part 'supervisors_event.dart';
part 'supervisors_state.dart';
part 'supervisors_bloc.freezed.dart';

class SupervisorsBloc extends Bloc<SupervisorsEvent, SupervisorsState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;

  SupervisorsBloc({required userRepository, required authenticationRepository})
      : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(const SupervisorsState.initial()) {
    on<GetSupervisors>(_onGetSupervisors);

    on<AddSupervised>(_onAddSupervised);

    on<DeleteSupervised>(_onDeleteSupervised);

    on<DeleteSupervisor>(_onDeleteSupervisor);
  }

  FutureOr<void> _onDeleteSupervised(
      DeleteSupervised event, Emitter<SupervisorsState> emit) async {
    emit(const SupervisorsState.loading());
    var response = await _userRepository.deleteSupervised(event.id);

    response.fold(
      (e) => emit(SupervisorsState.error(errorMessage: e.message)),
      (_) => emit(const SupervisorsState.added()),
    );
  }

  FutureOr<void> _onDeleteSupervisor(
      DeleteSupervisor event, Emitter<SupervisorsState> emit) async {
    emit(const SupervisorsState.loading());
    var response = await _userRepository.deleteSupervisor(event.id);

    response.fold(
      (e) => emit(SupervisorsState.error(errorMessage: e.message)),
      (_) => emit(const SupervisorsState.deleted()),
    );
  }

  FutureOr<void> _onGetSupervisors(
      GetSupervisors event, Emitter<SupervisorsState> emit) async {
    emit(const SupervisorsState.loading());

    var response =
        await _userRepository.getUser(_authenticationRepository.currentUser.id);

    response.fold(
      (e) => emit(SupervisorsState.error(errorMessage: e.message)),
      (user) {
        emit(SupervisorsState.success(
            supervisors: user.supervisors, supervised: user.supervised));
      },
    );
  }

  FutureOr<void> _onAddSupervised(
      AddSupervised event, Emitter<SupervisorsState> emit) async {
    emit(const SupervisorsState.loading());

    var response = await _userRepository.acceptInvitation(event.code);

    response.fold(
      (e) => emit(SupervisorsState.error(errorMessage: e.message)),
      (_) => emit(const SupervisorsState.added()),
    );
  }
}
