// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicineApplication _$$_MedicineApplicationFromJson(
        Map<String, dynamic> json) =>
    _$_MedicineApplication(
      json['aplication'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_MedicineApplicationToJson(
        _$_MedicineApplication instance) =>
    <String, dynamic>{
      'aplication': instance.aplication,
      'runtimeType': instance.$type,
    };

_$_MedicineDosis _$$_MedicineDosisFromJson(Map<String, dynamic> json) =>
    _$_MedicineDosis(
      name: json['name'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_MedicineDosisToJson(_$_MedicineDosis instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'unit': instance.unit,
      'runtimeType': instance.$type,
    };
