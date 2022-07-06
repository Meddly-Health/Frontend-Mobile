part of 'supervisors_bloc.dart';

@freezed
class SupervisorsEvent with _$SupervisorsEvent {
  const factory SupervisorsEvent.getSupervisors() = GetSupervisors;
  const factory SupervisorsEvent.addSupervised({required String code}) =
      AddSupervised;
  const factory SupervisorsEvent.deleteSupervised({required String id}) =
      DeleteSupervised;
  const factory SupervisorsEvent.deleteSupervisor({required String id}) =
      DeleteSupervisor;
}
