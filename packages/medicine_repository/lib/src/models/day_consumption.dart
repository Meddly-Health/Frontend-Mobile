import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'day_consumption.freezed.dart';
part 'day_consumption.g.dart';

@freezed
class DayConsumption with _$DayConsumption {
  const factory DayConsumption({
    required DateTime date,
    required List<Consumption> consumptions,
  }) = _DayConsumption;

  factory DayConsumption.fromJson(Map<String, dynamic> json) =>
      _$DayConsumptionFromJson(json);
}
