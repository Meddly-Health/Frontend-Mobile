// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NeedIt _$$_NeedItFromJson(Map<String, dynamic> json) => _$_NeedIt(
      name: json['name'] as String? ?? 'need_it',
      start: DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_NeedItToJson(_$_NeedIt instance) => <String, dynamic>{
      'name': instance.name,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$_EveryDay _$$_EveryDayFromJson(Map<String, dynamic> json) => _$_EveryDay(
      name: json['name'] as String? ?? 'every_day',
      start: DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_EveryDayToJson(_$_EveryDay instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$_EveryXDays _$$_EveryXDaysFromJson(Map<String, dynamic> json) =>
    _$_EveryXDays(
      name: json['name'] as String? ?? 'every_x_days',
      start: DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      days: json['days'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_EveryXDaysToJson(_$_EveryXDays instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'days': instance.days,
      'runtimeType': instance.$type,
    };

_$_SpecificDays _$$_SpecificDaysFromJson(Map<String, dynamic> json) =>
    _$_SpecificDays(
      name: json['name'] as String? ?? 'specific_days',
      start: DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SpecificDaysToJson(_$_SpecificDays instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'days': instance.days,
      'runtimeType': instance.$type,
    };
