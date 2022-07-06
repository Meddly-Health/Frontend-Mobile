import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_rule.freezed.dart';
part 'consumption_rule.g.dart';

@freezed
class ConsumptionRule with _$ConsumptionRule {
  const ConsumptionRule._();

  const factory ConsumptionRule.needIt({
    @Default('need_it') String? name,
    required DateTime start,
    DateTime? end,
  }) = _NeedIt;
  const factory ConsumptionRule.everyDay({
    @Default('every_day') String? name,
    required DateTime start,
    required List<DateTime> times,
    DateTime? end,
  }) = _EveryDay;
  const factory ConsumptionRule.everyXDays({
    @Default('every_x_days') String name,
    required DateTime start,
    DateTime? end,
    required int days,
  }) = _EveryXDays;
  const factory ConsumptionRule.specificDays({
    @Default('specific_days') String? name,
    required DateTime start,
    DateTime? end,
    required List<String> days,
  }) = _SpecificDays;

  // DateTime getConsumptionDate() {
  //   return when(
  //       needIt: (_, __, ___) => DateTime.now(),
  //       everyDay: (_, __, times, ___) {
  //         var now = DateTime.now();
  //         var hour = now.hour;

  //       },
  //       everyXDays: (_, __, ___, xdays) => DateTime.now(),
  //       specificDays: (_, __, ___, days) => DateTime.now());
  // }

  factory ConsumptionRule.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionRuleFromJson(json);
}
