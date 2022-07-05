import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_rule.freezed.dart';
part 'consumption_rule.g.dart';

@freezed
class ConsumptionRule with _$ConsumptionRule {
  const factory ConsumptionRule.needIt({
    @Default('need_it') String? name,
    required DateTime start,
    DateTime? end,
  }) = _NeedIt;
  const factory ConsumptionRule.everyDay({
    @Default('every_day') String? name,
    required DateTime start,
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

  factory ConsumptionRule.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionRuleFromJson(json);
}
