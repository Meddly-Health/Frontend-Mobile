// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Treatment _$$_TreatmentFromJson(Map<String, dynamic> json) => _$_Treatment(
      id: json['id'] as String,
      name: json['name'] as String,
      medicine: Medicine.fromJson(json['medicine'] as Map<String, dynamic>),
      stock: json['stock'] as int,
      stockWarning: json['stock_warning'] as int?,
      treatmentIndication: TreatmentIndication.fromJson(
          json['treatment_indication'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TreatmentToJson(_$_Treatment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'medicine': instance.medicine.toJson(),
      'stock': instance.stock,
      'stock_warning': instance.stockWarning,
      'treatment_indication': instance.treatmentIndication.toJson(),
    };
