part of 'supervisors_bloc.dart';

@immutable
abstract class SupervisorsEvent {}

class GetSupervisors extends SupervisorsEvent {}

class AddSupervised extends SupervisorsEvent {
  final String code;

  AddSupervised(this.code);
}

class DeleteSupervised extends SupervisorsEvent {
  final String id;

  DeleteSupervised(this.id);
}

class DeleteSupervisor extends SupervisorsEvent {
  final String id;

  DeleteSupervisor(this.id);
}
