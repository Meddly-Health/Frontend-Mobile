import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:treatment_repository/treatment_repository.dart';

part 'treatment_state.dart';
part 'treatment_cubit.freezed.dart';

final Treatment treatment = Treatment(
  id: '9ed9de58-c36c-44e6-b03b-062ce204815f',
  name: 'nombre tratamiento',
  medicine: const Medicine(
    icon: 'google.com/icon',
    name: 'Paracetamol',
    method: Method.medicineDosis(name: 'Pastilla', value: 10, unit: 'g'),
  ),
  stockWarning: 5,
  stock: 10,
  treatmentIndication: TreatmentIndication(
      instructions: 'Tomarlo cada 8 horas',
      consumptionRule: ConsumptionRule.specificDays(
          start: DateTime.now(),
          end: DateTime(2023),
          days: ['monday', 'tuesday', 'wednesday', 'sunday']),
      start: DateTime.now(),
      end: DateTime.now()),
);

class TreatmentCubit extends Cubit<TreatmentState> {
  TreatmentCubit({required TreatmentRepository treatmentRepository})
      : _treatmentRepository = treatmentRepository,
        super(const TreatmentState.initial());

  final TreatmentRepository _treatmentRepository;

  void addTreatment(Treatment treatment) async {
    emit(const TreatmentState.loading());

    var response = await _treatmentRepository.addTreatment(treatment);

    response.fold(
      (error) => emit(TreatmentState.error(error.message)),
      (treatment) => emit(TreatmentState.added(treatment)),
    );
  }

  void addConsumption(String id, DateTime consumptionDate) async {
    emit(const TreatmentState.loading());

    var response =
        await _treatmentRepository.addConsumption(id, consumptionDate);

    response.fold(
      (error) => emit(TreatmentState.error(error.message)),
      (_) => emit(const TreatmentState.consumptionAdded()),
    );
  }

  void getTreatments() async {
    emit(const TreatmentState.loading());

    var response = await _treatmentRepository.getTreatments();

    response.fold(
      (error) => emit(TreatmentState.error(error.message)),
      (treatments) => emit(TreatmentState.loaded(treatments)),
    );
  }

  void updateTreatment(Treatment treatment) async {
    emit(const TreatmentState.loading());

    var response = await _treatmentRepository.updateTreatment(treatment);

    response.fold(
      (error) => emit(TreatmentState.error(error.message)),
      (treatment) => emit(TreatmentState.updated(treatment)),
    );
  }

  void deleteConsumption(String id, DateTime consumptionDate) async {
    emit(const TreatmentState.loading());

    var response =
        await _treatmentRepository.deleteConsumption(id, consumptionDate);

    response.fold(
      (error) => emit(TreatmentState.error(error.message)),
      (_) => emit(const TreatmentState.consumptionDeleted()),
    );
  }

  void deleteTreatment(Treatment treatment) async {
    emit(const TreatmentState.loading());

    var response = await _treatmentRepository.deleteTreatment(treatment);

    response.fold(
      (error) => emit(TreatmentState.error(error.message)),
      (treatment) => emit(const TreatmentState.deleted()),
    );
  }
}
