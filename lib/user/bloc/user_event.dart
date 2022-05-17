part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserLoading extends UserEvent {}

class UserDelete extends UserEvent {}

class UserUpdate extends UserEvent {}
