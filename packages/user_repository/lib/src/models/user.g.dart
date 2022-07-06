// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapater extends TypeAdapter<_$_User> {
  @override
  final int typeId = 1;

  @override
  _$_User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_User(
      id: fields[1] as String?,
      email: fields[2] as String?,
      avatar: fields[3] == null
          ? 'assets/avatar/avatar0-1-1.svg'
          : fields[3] as String?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
      diseases: (fields[6] as List?)?.cast<String>(),
      supervisors: (fields[7] as List?)?.cast<User>(),
      supervised: (fields[8] as List?)?.cast<User>(),
      firstName: fields[9] as String?,
      lastName: fields[10] as String?,
      height: fields[11] as double?,
      weight: fields[12] as double?,
      sex: fields[13] as Sex?,
      birth: fields[14] as DateTime?,
      invitation: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_User obj) {
    writer
      ..writeByte(15)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.firstName)
      ..writeByte(10)
      ..write(obj.lastName)
      ..writeByte(11)
      ..write(obj.height)
      ..writeByte(12)
      ..write(obj.weight)
      ..writeByte(13)
      ..write(obj.sex)
      ..writeByte(14)
      ..write(obj.birth)
      ..writeByte(15)
      ..write(obj.invitation)
      ..writeByte(6)
      ..write(obj.diseases)
      ..writeByte(7)
      ..write(obj.supervisors)
      ..writeByte(8)
      ..write(obj.supervised);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapater &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String? ?? 'assets/avatar/avatar0-1-1.svg',
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
      'supervisors': instance.supervisors?.map((e) => e.toJson()).toList(),
      'supervised': instance.supervised?.map((e) => e.toJson()).toList(),
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
