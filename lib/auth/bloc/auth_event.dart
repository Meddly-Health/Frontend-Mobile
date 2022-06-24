part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.logoutRequestedEvent() = AuthLogoutRequestedEvent;
  const factory AuthEvent.userChanged(AuthUser user) = AuthUserChanged;
}
