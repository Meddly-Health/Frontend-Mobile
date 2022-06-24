// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment_indication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TreatmentIndication _$$_TreatmentIndicationFromJson(
        Map<String, dynamic> json) =>
    _$_TreatmentIndication(
      instructions: json['instructions'] as String?,
      history: (json['history'] as List<dynamic>)
          .map((e) => DayConsumption.fromJson(e as Map<String, dynamic>))
          .toList(),
      consumptionRule: ConsumptionRule.fromJson(
          json['consumption_rule'] as Map<String, dynamic>),
      start: DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$$_TreatmentIndicationToJson(
        _$_TreatmentIndication instance) =>
    <String, dynamic>{
      'instructions': instance.instructions,
      'history': instance.history,
      'consumption_rule': instance.consumptionRule,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
