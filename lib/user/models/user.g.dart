// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['user_id'] as String?,
      email: json['email'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      diseases: (json['diseases'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      supervisors: (json['supervisors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      supervisedBy: (json['supervisedBy'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.id,
      'email': instance.email,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'diseases': instance.diseases,
      'supervisors': instance.supervisors,
      'supervisedBy': instance.supervisedBy,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'height': instance.height,
      'weight': instance.weight,
      'sex': _$SexEnumMap[instance.sex],
      'birth': instance.birth?.toIso8601String(),
    };

const _$SexEnumMap = {
  Sex.masculino: 'masculino',
  Sex.femenino: 'femenino',
  Sex.otro: 'otro',
};
