// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NeedIt _$$_NeedItFromJson(Map<String, dynamic> json) => _$_NeedIt(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_NeedItToJson(_$_NeedIt instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_EveryDay _$$_EveryDayFromJson(Map<String, dynamic> json) => _$_EveryDay(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_EveryDayToJson(_$_EveryDay instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_EveryXDays _$$_EveryXDaysFromJson(Map<String, dynamic> json) =>
    _$_EveryXDays(
      json['days'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_EveryXDaysToJson(_$_EveryXDays instance) =>
    <String, dynamic>{
      'days': instance.days,
      'runtimeType': instance.$type,
    };

_$_SpecificDays _$$_SpecificDaysFromJson(Map<String, dynamic> json) =>
    _$_SpecificDays(
      (json['days'] as List<dynamic>).map((e) => e as int).toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_SpecificDaysToJson(_$_SpecificDays instance) =>
    <String, dynamic>{
      'days': instance.days,
      'runtimeType': instance.$type,
    };
