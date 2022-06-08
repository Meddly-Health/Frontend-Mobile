// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUser extends UserEvent {}

class DeleteUser extends UserEvent {}

class UserUpdate extends UserEvent {
  final User user;
  UserUpdate({
    required this.user,
  });
}

class Logout extends UserEvent {}

class UserChangedSupervisor extends UserEvent {
  final User user;
  UserChangedSupervisor({
    required this.user,
  });
}

class UserNameChanged extends UserEvent {
  final String value;
  UserNameChanged({
    required this.value,
  });
}

class UserLastNameChanged extends UserEvent {
  final String value;
  UserLastNameChanged({
    required this.value,
  });
}

class UserBirthdateChanged extends UserEvent {
  final DateTime value;
  UserBirthdateChanged({
    required this.value,
  });
}

class UserFormEnable extends UserEvent {
  final bool value;
  UserFormEnable({
    required this.value,
  });
}

class UserWeightChanged extends UserEvent {
  final double value;
  UserWeightChanged({
    required this.value,
  });
}

class UserHeightChanged extends UserEvent {
  final int value;
  UserHeightChanged({
    required this.value,
  });
}

class UserSexChanged extends UserEvent {
  final Sex sex;
  UserSexChanged({required this.sex});
}
