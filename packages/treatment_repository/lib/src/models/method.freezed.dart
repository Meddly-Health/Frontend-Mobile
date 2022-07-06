// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Method _$MethodFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'medicineDosis':
      return _MedicineApplication.fromJson(json);
    case 'medicineApplication':
      return _MedicineDosis.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Method',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Method {
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int value, String unit)
        medicineDosis,
    required TResult Function(String name, String? description)
        medicineApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int value, String unit)? medicineDosis,
    TResult Function(String name, String? description)? medicineApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int value, String unit)? medicineDosis,
    TResult Function(String name, String? description)? medicineApplication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineApplication value) medicineDosis,
    required TResult Function(_MedicineDosis value) medicineApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineDosis,
    TResult Function(_MedicineDosis value)? medicineApplication,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineDosis,
    TResult Function(_MedicineDosis value)? medicineApplication,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MethodCopyWith<Method> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodCopyWith<$Res> {
  factory $MethodCopyWith(Method value, $Res Function(Method) then) =
      _$MethodCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$MethodCopyWithImpl<$Res> implements $MethodCopyWith<$Res> {
  _$MethodCopyWithImpl(this._value, this._then);

  final Method _value;
  // ignore: unused_field
  final $Res Function(Method) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MedicineApplicationCopyWith<$Res>
    implements $MethodCopyWith<$Res> {
  factory _$$_MedicineApplicationCopyWith(_$_MedicineApplication value,
          $Res Function(_$_MedicineApplication) then) =
      __$$_MedicineApplicationCopyWithImpl<$Res>;
  @override
  $Res call({String name, int value, String unit});
}

/// @nodoc
class __$$_MedicineApplicationCopyWithImpl<$Res>
    extends _$MethodCopyWithImpl<$Res>
    implements _$$_MedicineApplicationCopyWith<$Res> {
  __$$_MedicineApplicationCopyWithImpl(_$_MedicineApplication _value,
      $Res Function(_$_MedicineApplication) _then)
      : super(_value, (v) => _then(v as _$_MedicineApplication));

  @override
  _$_MedicineApplication get _value => super._value as _$_MedicineApplication;

  @override
  $Res call({
    Object? name = freezed,
    Object? value = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_MedicineApplication(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicineApplication implements _MedicineApplication {
  const _$_MedicineApplication(
      {required this.name,
      required this.value,
      required this.unit,
      final String? $type})
      : $type = $type ?? 'medicineDosis';

  factory _$_MedicineApplication.fromJson(Map<String, dynamic> json) =>
      _$$_MedicineApplicationFromJson(json);

  @override
  final String name;
  @override
  final int value;
  @override
  final String unit;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Method.medicineDosis(name: $name, value: $value, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicineApplication &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(unit));

  @JsonKey(ignore: true)
  @override
  _$$_MedicineApplicationCopyWith<_$_MedicineApplication> get copyWith =>
      __$$_MedicineApplicationCopyWithImpl<_$_MedicineApplication>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int value, String unit)
        medicineDosis,
    required TResult Function(String name, String? description)
        medicineApplication,
  }) {
    return medicineDosis(name, value, unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int value, String unit)? medicineDosis,
    TResult Function(String name, String? description)? medicineApplication,
  }) {
    return medicineDosis?.call(name, value, unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int value, String unit)? medicineDosis,
    TResult Function(String name, String? description)? medicineApplication,
    required TResult orElse(),
  }) {
    if (medicineDosis != null) {
      return medicineDosis(name, value, unit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineApplication value) medicineDosis,
    required TResult Function(_MedicineDosis value) medicineApplication,
  }) {
    return medicineDosis(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineDosis,
    TResult Function(_MedicineDosis value)? medicineApplication,
  }) {
    return medicineDosis?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineDosis,
    TResult Function(_MedicineDosis value)? medicineApplication,
    required TResult orElse(),
  }) {
    if (medicineDosis != null) {
      return medicineDosis(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicineApplicationToJson(this);
  }
}

abstract class _MedicineApplication implements Method {
  const factory _MedicineApplication(
      {required final String name,
      required final int value,
      required final String unit}) = _$_MedicineApplication;

  factory _MedicineApplication.fromJson(Map<String, dynamic> json) =
      _$_MedicineApplication.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MedicineApplicationCopyWith<_$_MedicineApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MedicineDosisCopyWith<$Res>
    implements $MethodCopyWith<$Res> {
  factory _$$_MedicineDosisCopyWith(
          _$_MedicineDosis value, $Res Function(_$_MedicineDosis) then) =
      __$$_MedicineDosisCopyWithImpl<$Res>;
  @override
  $Res call({String name, String? description});
}

/// @nodoc
class __$$_MedicineDosisCopyWithImpl<$Res> extends _$MethodCopyWithImpl<$Res>
    implements _$$_MedicineDosisCopyWith<$Res> {
  __$$_MedicineDosisCopyWithImpl(
      _$_MedicineDosis _value, $Res Function(_$_MedicineDosis) _then)
      : super(_value, (v) => _then(v as _$_MedicineDosis));

  @override
  _$_MedicineDosis get _value => super._value as _$_MedicineDosis;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_MedicineDosis(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicineDosis implements _MedicineDosis {
  const _$_MedicineDosis(
      {required this.name, this.description, final String? $type})
      : $type = $type ?? 'medicineApplication';

  factory _$_MedicineDosis.fromJson(Map<String, dynamic> json) =>
      _$$_MedicineDosisFromJson(json);

  @override
  final String name;
  @override
  final String? description;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Method.medicineApplication(name: $name, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicineDosis &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_MedicineDosisCopyWith<_$_MedicineDosis> get copyWith =>
      __$$_MedicineDosisCopyWithImpl<_$_MedicineDosis>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, int value, String unit)
        medicineDosis,
    required TResult Function(String name, String? description)
        medicineApplication,
  }) {
    return medicineApplication(name, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name, int value, String unit)? medicineDosis,
    TResult Function(String name, String? description)? medicineApplication,
  }) {
    return medicineApplication?.call(name, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, int value, String unit)? medicineDosis,
    TResult Function(String name, String? description)? medicineApplication,
    required TResult orElse(),
  }) {
    if (medicineApplication != null) {
      return medicineApplication(name, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineApplication value) medicineDosis,
    required TResult Function(_MedicineDosis value) medicineApplication,
  }) {
    return medicineApplication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineDosis,
    TResult Function(_MedicineDosis value)? medicineApplication,
  }) {
    return medicineApplication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineDosis,
    TResult Function(_MedicineDosis value)? medicineApplication,
    required TResult orElse(),
  }) {
    if (medicineApplication != null) {
      return medicineApplication(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicineDosisToJson(this);
  }
}

abstract class _MedicineDosis implements Method {
  const factory _MedicineDosis(
      {required final String name,
      final String? description}) = _$_MedicineDosis;

  factory _MedicineDosis.fromJson(Map<String, dynamic> json) =
      _$_MedicineDosis.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MedicineDosisCopyWith<_$_MedicineDosis> get copyWith =>
      throw _privateConstructorUsedError;
}
