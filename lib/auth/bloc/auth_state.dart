part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

@freezed
class AuthState with _$AuthState {
  // final AuthStatus status;
  // final AuthUser user;

  // const factory AuthState.({required this.status, this.user = AuthUser.empty});

  const factory AuthState.authenticated(AuthUser user) = _AuthenticatedState;

  const factory AuthState.unauthenticated() = _UnauthenticatedState;
}
