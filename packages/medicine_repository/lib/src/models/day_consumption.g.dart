// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DayConsumption _$$_DayConsumptionFromJson(Map<String, dynamic> json) =>
    _$_DayConsumption(
      date: DateTime.parse(json['date'] as String),
      consumptions: (json['consumptions'] as List<dynamic>)
          .map((e) => Consumption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DayConsumptionToJson(_$_DayConsumption instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'consumptions': instance.consumptions,
    };
