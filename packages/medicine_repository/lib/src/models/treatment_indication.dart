import 'package:freezed_annotation/freezed_annotation.dart';
import '/src/models/models.dart';

part 'treatment_indication.g.dart';
part 'treatment_indication.freezed.dart';

@freezed
class TreatmentIndication with _$TreatmentIndication {
  const factory TreatmentIndication({
    String? instructions,
    required List<DayConsumption> history,
    @JsonKey(name: 'consumption_rule') required ConsumptionRule consumptionRule,
    required DateTime start,
    required DateTime? end,
  }) = _TreatmentIndication;

  factory TreatmentIndication.fromJson(Map<String, dynamic> json) =>
      _$TreatmentIndicationFromJson(json);
}
