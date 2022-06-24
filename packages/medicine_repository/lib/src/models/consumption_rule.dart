import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_rule.freezed.dart';
part 'consumption_rule.g.dart';

@freezed
abstract class ConsumptionRule with _$ConsumptionRule {
  const factory ConsumptionRule.needIt() = _NeedIt;
  const factory ConsumptionRule.everyDay() = _EveryDay;
  const factory ConsumptionRule.everyXDays(int days) = _EveryXDays;
  const factory ConsumptionRule.specificDays(List<int> days) = _SpecificDays;

  factory ConsumptionRule.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionRuleFromJson(json);
}
