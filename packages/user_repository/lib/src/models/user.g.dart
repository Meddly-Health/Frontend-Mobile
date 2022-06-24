// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String? ?? 'assets/avatar/default.svg',
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
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      supervised: (json['supervised'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      sex: $enumDecodeNullable(_$SexEnumMap, json['sex']),
      birth: json['birth'] == null
          ? null
          : DateTime.parse(json['birth'] as String),
      invitation: json['invitation'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'diseases': instance.diseases,
      'supervisors': instance.supervisors,
      'supervised': instance.supervised,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'height': instance.height,
      'weight': instance.weight,
      'sex': _$SexEnumMap[instance.sex],
      'birth': instance.birth?.toIso8601String(),
      'invitation': instance.invitation,
    };

const _$SexEnumMap = {
  Sex.masculino: 'masculino',
  Sex.femenino: 'femenino',
  Sex.otro: 'otro',
};
