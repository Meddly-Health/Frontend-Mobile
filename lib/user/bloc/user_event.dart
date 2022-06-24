part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUser() = GetUser;
  const factory UserEvent.deleteUser() = DeleteUser;
  const factory UserEvent.updateUser(User user) = UpdateUser;
  const factory UserEvent.logout() = Logout;
  const factory UserEvent.changeSupervisor(User? user) = ChangeSupervisor;
}
