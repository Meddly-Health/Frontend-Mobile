import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:treatment_repository/src/models/consumption.dart';

part 'day_consumption.freezed.dart';
part 'day_consumption.g.dart';

@freezed
class DayConsumption with _$DayConsumption {
  @JsonSerializable(explicitToJson: true)
  const factory DayConsumption({
    required DateTime date,
    required List<Consumption> consumptions,
  }) = _DayConsumption;

  factory DayConsumption.fromJson(Map<String, dynamic> json) =>
      _$DayConsumptionFromJson(json);
}
