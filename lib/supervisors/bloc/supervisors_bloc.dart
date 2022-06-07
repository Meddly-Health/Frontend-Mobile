import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'supervisors_event.dart';
part 'supervisors_state.dart';

class SupervisorsBloc extends Bloc<SupervisorsEvent, SupervisorsState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;

  SupervisorsBloc({required userRepository, required authenticationRepository})
      : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(const SupervisorsState()) {
    on<GetSupervisors>(_onGetSupervisors);

    on<AddSupervised>(_onAddSupervised);

    on<DeleteSupervised>(_onDeleteSupervised);

    on<DeleteSupervisor>(_onDeleteSupervisor);
  }

  FutureOr<void> _onDeleteSupervised(
      DeleteSupervised event, Emitter<SupervisorsState> emit) async {
    emit(state.copyWith(status: SupervisorsStatus.loading));
    var response = await _userRepository.deleteSupervised(event.id);

    response.fold(
      (l) => emit(state.copyWith(
          status: SupervisorsStatus.error, errorMessage: l.message)),
      (r) {
        emit(state.copyWith(status: SupervisorsStatus.deleted));
        add(GetSupervisors());
      },
    );
  }

  FutureOr<void> _onDeleteSupervisor(
      DeleteSupervisor event, Emitter<SupervisorsState> emit) async {
    emit(state.copyWith(status: SupervisorsStatus.loading));
    var response = await _userRepository.deleteSupervisor(event.id);

    response.fold(
      (l) => emit(state.copyWith(
          status: SupervisorsStatus.error, errorMessage: l.message)),
      (r) {
        emit(state.copyWith(status: SupervisorsStatus.deleted));
        add(GetSupervisors());
      },
    );
  }

  FutureOr<void> _onGetSupervisors(
      GetSupervisors event, Emitter<SupervisorsState> emit) async {
    emit(state.copyWith(status: SupervisorsStatus.loading));

    var response =
        await _userRepository.getUser(_authenticationRepository.currentUser.id);

    response.fold(
      (error) => emit(const SupervisorsState(status: SupervisorsStatus.error)),
      (user) {
        emit(SupervisorsState(
          status: SupervisorsStatus.success,
          supervisors: user.supervisors,
          supervised: user.supervised,
        ));
      },
    );
  }

  FutureOr<void> _onAddSupervised(
      AddSupervised event, Emitter<SupervisorsState> emit) async {
    emit(state.copyWith(status: SupervisorsStatus.loading));

    var response = await _userRepository.acceptInvitation(event.code);

    response.fold(
      (UserException l) => emit(state.copyWith(
          status: SupervisorsStatus.error, errorMessage: l.message)),
      (_) {
        emit(state.copyWith(status: SupervisorsStatus.added));

        add(GetSupervisors());
      },
    );
  }
}
