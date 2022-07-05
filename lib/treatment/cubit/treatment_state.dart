part of 'treatment_cubit.dart';

@freezed
class TreatmentState with _$TreatmentState {
  const factory TreatmentState.initial() = _Initial;
  const factory TreatmentState.loading() = _Loading;
  const factory TreatmentState.added(Treatment treatment) = _Added;
  const factory TreatmentState.updated(Treatment treatment) = _Updated;
  const factory TreatmentState.deleted() = _Deleted;
  const factory TreatmentState.consumptionAdded() = _ConsumptionAdded;
  const factory TreatmentState.consumptionDeleted() = _ConsumptionDeleted;
  const factory TreatmentState.error(String? errorMessage) = _Error;
  const factory TreatmentState.loaded(List<Treatment> treatments) = _Loaded;
}
