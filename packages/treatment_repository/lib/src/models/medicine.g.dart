// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Medicine _$$_MedicineFromJson(Map<String, dynamic> json) => _$_Medicine(
      name: json['name'] as String,
      icon: json['icon'] as String,
      method: Method.fromJson(json['method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MedicineToJson(_$_Medicine instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'method': instance.method.toJson(),
    };
