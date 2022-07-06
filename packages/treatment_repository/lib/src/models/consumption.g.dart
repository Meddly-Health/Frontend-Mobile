// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Consumption _$$_ConsumptionFromJson(Map<String, dynamic> json) =>
    _$_Consumption(
      consumed: json['consumed'] as bool,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_ConsumptionToJson(_$_Consumption instance) =>
    <String, dynamic>{
      'consumed': instance.consumed,
      'date': instance.date.toIso8601String(),
    };
