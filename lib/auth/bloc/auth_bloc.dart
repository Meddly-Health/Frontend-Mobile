import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<AuthUser> _userSubscription;

  AuthBloc({required authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(authenticationRepository.currentUser.isNotEmpty
            ? AuthState.authenticated(authenticationRepository.currentUser)
            : const AuthState.unauthenticated()) {
    on<AuthUserChanged>(_onUserChanged);

    on<AuthLogoutRequestedEvent>(_onLogoutRequested);

    _userSubscription = _authenticationRepository.user
        .listen((AuthUser user) => add(AuthUserChanged(user)));
  }

  void _onUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.user.isEmpty
        ? emit(const AuthState.unauthenticated())
        : emit(AuthState.authenticated(event.user));
  }

  void _onLogoutRequested(
      AuthLogoutRequestedEvent event, Emitter<AuthState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
