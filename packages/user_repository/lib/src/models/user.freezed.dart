// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '_id')
  @HiveField(1)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: 'assets/avatar/avatar0-1-1.svg')
  @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @HiveField(4)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @HiveField(5)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String>? get diseases => throw _privateConstructorUsedError;
  @HiveField(7)
  List<User>? get supervisors => throw _privateConstructorUsedError;
  @HiveField(8)
  List<User>? get supervised => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  @HiveField(9)
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  @HiveField(10)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(11)
  double? get height => throw _privateConstructorUsedError;
  @HiveField(12)
  double? get weight => throw _privateConstructorUsedError;
  @HiveField(13)
  Sex? get sex => throw _privateConstructorUsedError;
  @HiveField(14)
  DateTime? get birth => throw _privateConstructorUsedError;
  @HiveField(15)
  String? get invitation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id')
      @HiveField(1)
          String? id,
      @HiveField(2)
          String? email,
      @HiveField(3, defaultValue: 'assets/avatar/avatar0-1-1.svg')
      @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
          String? avatar,
      @JsonKey(name: 'created_at')
      @HiveField(4)
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @HiveField(5)
          DateTime? updatedAt,
      @HiveField(6)
          List<String>? diseases,
      @HiveField(7)
          List<User>? supervisors,
      @HiveField(8)
          List<User>? supervised,
      @JsonKey(name: 'first_name')
      @HiveField(9)
          String? firstName,
      @JsonKey(name: 'last_name')
      @HiveField(10)
          String? lastName,
      @HiveField(11)
          double? height,
      @HiveField(12)
          double? weight,
      @HiveField(13)
          Sex? sex,
      @HiveField(14)
          DateTime? birth,
      @HiveField(15)
          String? invitation});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? diseases = freezed,
    Object? supervisors = freezed,
    Object? supervised = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? sex = freezed,
    Object? birth = freezed,
    Object? invitation = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diseases: diseases == freezed
          ? _value.diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      supervisors: supervisors == freezed
          ? _value.supervisors
          : supervisors // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      supervised: supervised == freezed
          ? _value.supervised
          : supervised // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      birth: birth == freezed
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invitation: invitation == freezed
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id')
      @HiveField(1)
          String? id,
      @HiveField(2)
          String? email,
      @HiveField(3, defaultValue: 'assets/avatar/avatar0-1-1.svg')
      @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
          String? avatar,
      @JsonKey(name: 'created_at')
      @HiveField(4)
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @HiveField(5)
          DateTime? updatedAt,
      @HiveField(6)
          List<String>? diseases,
      @HiveField(7)
          List<User>? supervisors,
      @HiveField(8)
          List<User>? supervised,
      @JsonKey(name: 'first_name')
      @HiveField(9)
          String? firstName,
      @JsonKey(name: 'last_name')
      @HiveField(10)
          String? lastName,
      @HiveField(11)
          double? height,
      @HiveField(12)
          double? weight,
      @HiveField(13)
          Sex? sex,
      @HiveField(14)
          DateTime? birth,
      @HiveField(15)
          String? invitation});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? diseases = freezed,
    Object? supervisors = freezed,
    Object? supervised = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? sex = freezed,
    Object? birth = freezed,
    Object? invitation = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diseases: diseases == freezed
          ? _value._diseases
          : diseases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      supervisors: supervisors == freezed
          ? _value._supervisors
          : supervisors // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      supervised: supervised == freezed
          ? _value._supervised
          : supervised // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex?,
      birth: birth == freezed
          ? _value.birth
          : birth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invitation: invitation == freezed
          ? _value.invitation
          : invitation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'UserAdapater')
@JsonSerializable(explicitToJson: true)
class _$_User extends _User {
  const _$_User(
      {@JsonKey(name: '_id')
      @HiveField(1)
          this.id,
      @HiveField(2)
          this.email,
      @HiveField(3, defaultValue: 'assets/avatar/avatar0-1-1.svg')
      @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
          this.avatar,
      @JsonKey(name: 'created_at')
      @HiveField(4)
          this.createdAt,
      @JsonKey(name: 'updated_at')
      @HiveField(5)
          this.updatedAt,
      @HiveField(6)
          final List<String>? diseases,
      @HiveField(7)
          final List<User>? supervisors,
      @HiveField(8)
          final List<User>? supervised,
      @JsonKey(name: 'first_name')
      @HiveField(9)
          this.firstName,
      @JsonKey(name: 'last_name')
      @HiveField(10)
          this.lastName,
      @HiveField(11)
          this.height,
      @HiveField(12)
          this.weight,
      @HiveField(13)
          this.sex,
      @HiveField(14)
          this.birth,
      @HiveField(15)
          this.invitation})
      : _diseases = diseases,
        _supervisors = supervisors,
        _supervised = supervised,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: '_id')
  @HiveField(1)
  final String? id;
  @override
  @HiveField(2)
  final String? email;
  @override
  @HiveField(3, defaultValue: 'assets/avatar/avatar0-1-1.svg')
  @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
  final String? avatar;
  @override
  @JsonKey(name: 'created_at')
  @HiveField(4)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  @HiveField(5)
  final DateTime? updatedAt;
  final List<String>? _diseases;
  @override
  @HiveField(6)
  List<String>? get diseases {
    final value = _diseases;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _supervisors;
  @override
  @HiveField(7)
  List<User>? get supervisors {
    final value = _supervisors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _supervised;
  @override
  @HiveField(8)
  List<User>? get supervised {
    final value = _supervised;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'first_name')
  @HiveField(9)
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  @HiveField(10)
  final String? lastName;
  @override
  @HiveField(11)
  final double? height;
  @override
  @HiveField(12)
  final double? weight;
  @override
  @HiveField(13)
  final Sex? sex;
  @override
  @HiveField(14)
  final DateTime? birth;
  @override
  @HiveField(15)
  final String? invitation;

  @override
  String toString() {
    return 'User(id: $id, email: $email, avatar: $avatar, createdAt: $createdAt, updatedAt: $updatedAt, diseases: $diseases, supervisors: $supervisors, supervised: $supervised, firstName: $firstName, lastName: $lastName, height: $height, weight: $weight, sex: $sex, birth: $birth, invitation: $invitation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other._diseases, _diseases) &&
            const DeepCollectionEquality()
                .equals(other._supervisors, _supervisors) &&
            const DeepCollectionEquality()
                .equals(other._supervised, _supervised) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.sex, sex) &&
            const DeepCollectionEquality().equals(other.birth, birth) &&
            const DeepCollectionEquality()
                .equals(other.invitation, invitation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(_diseases),
      const DeepCollectionEquality().hash(_supervisors),
      const DeepCollectionEquality().hash(_supervised),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(sex),
      const DeepCollectionEquality().hash(birth),
      const DeepCollectionEquality().hash(invitation));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  const factory _User(
      {@JsonKey(name: '_id')
      @HiveField(1)
          final String? id,
      @HiveField(2)
          final String? email,
      @HiveField(3, defaultValue: 'assets/avatar/avatar0-1-1.svg')
      @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
          final String? avatar,
      @JsonKey(name: 'created_at')
      @HiveField(4)
          final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      @HiveField(5)
          final DateTime? updatedAt,
      @HiveField(6)
          final List<String>? diseases,
      @HiveField(7)
          final List<User>? supervisors,
      @HiveField(8)
          final List<User>? supervised,
      @JsonKey(name: 'first_name')
      @HiveField(9)
          final String? firstName,
      @JsonKey(name: 'last_name')
      @HiveField(10)
          final String? lastName,
      @HiveField(11)
          final double? height,
      @HiveField(12)
          final double? weight,
      @HiveField(13)
          final Sex? sex,
      @HiveField(14)
          final DateTime? birth,
      @HiveField(15)
          final String? invitation}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: '_id')
  @HiveField(1)
  String? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String? get email => throw _privateConstructorUsedError;
  @override
  @HiveField(3, defaultValue: 'assets/avatar/avatar0-1-1.svg')
  @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
  String? get avatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  @HiveField(4)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'updated_at')
  @HiveField(5)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  List<String>? get diseases => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  List<User>? get supervisors => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  List<User>? get supervised => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'first_name')
  @HiveField(9)
  String? get firstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'last_name')
  @HiveField(10)
  String? get lastName => throw _privateConstructorUsedError;
  @override
  @HiveField(11)
  double? get height => throw _privateConstructorUsedError;
  @override
  @HiveField(12)
  double? get weight => throw _privateConstructorUsedError;
  @override
  @HiveField(13)
  Sex? get sex => throw _privateConstructorUsedError;
  @override
  @HiveField(14)
  DateTime? get birth => throw _privateConstructorUsedError;
  @override
  @HiveField(15)
  String? get invitation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
