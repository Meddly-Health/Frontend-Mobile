import 'package:freezed_annotation/freezed_annotation.dart';
import '/src/models/consumption_rule.dart';
import '/src/models/day_consumption.dart';

part 'treatment_indication.g.dart';
part 'treatment_indication.freezed.dart';

@freezed
class TreatmentIndication with _$TreatmentIndication {
  @JsonSerializable(explicitToJson: true)
  const factory TreatmentIndication({
    String? instructions,
    List<DayConsumption>? history,
    @JsonKey(name: 'consumption_rule') required ConsumptionRule consumptionRule,
    required DateTime start,
    required DateTime? end,
  }) = _TreatmentIndication;

  factory TreatmentIndication.fromJson(Map<String, dynamic> json) =>
      _$TreatmentIndicationFromJson(json);
}
