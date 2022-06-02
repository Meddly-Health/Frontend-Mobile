// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserGet extends UserEvent {}

class UserDelete extends UserEvent {}

class UserUpdate extends UserEvent {
  final User user;
  UserUpdate({
    required this.user,
  });
}

class UserChangedSupervisor extends UserEvent {
  final User user;
  UserChangedSupervisor({
    required this.user,
  });
}

class UserAddSupervised extends UserEvent {
  final String code;
  UserAddSupervised({
    required this.code,
  });
}
