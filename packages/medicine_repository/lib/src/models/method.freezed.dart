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
    case 'medicineAplication':
      return _MedicineApplication.fromJson(json);
    case 'medicineDosis':
      return _MedicineDosis.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Method',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Method {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String aplication) medicineAplication,
    required TResult Function(String name, double value, String unit)
        medicineDosis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String aplication)? medicineAplication,
    TResult Function(String name, double value, String unit)? medicineDosis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String aplication)? medicineAplication,
    TResult Function(String name, double value, String unit)? medicineDosis,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineApplication value) medicineAplication,
    required TResult Function(_MedicineDosis value) medicineDosis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineAplication,
    TResult Function(_MedicineDosis value)? medicineDosis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineAplication,
    TResult Function(_MedicineDosis value)? medicineDosis,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodCopyWith<$Res> {
  factory $MethodCopyWith(Method value, $Res Function(Method) then) =
      _$MethodCopyWithImpl<$Res>;
}

/// @nodoc
class _$MethodCopyWithImpl<$Res> implements $MethodCopyWith<$Res> {
  _$MethodCopyWithImpl(this._value, this._then);

  final Method _value;
  // ignore: unused_field
  final $Res Function(Method) _then;
}

/// @nodoc
abstract class _$$_MedicineApplicationCopyWith<$Res> {
  factory _$$_MedicineApplicationCopyWith(_$_MedicineApplication value,
          $Res Function(_$_MedicineApplication) then) =
      __$$_MedicineApplicationCopyWithImpl<$Res>;
  $Res call({String aplication});
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
    Object? aplication = freezed,
  }) {
    return _then(_$_MedicineApplication(
      aplication == freezed
          ? _value.aplication
          : aplication // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicineApplication implements _MedicineApplication {
  const _$_MedicineApplication(this.aplication, {final String? $type})
      : $type = $type ?? 'medicineAplication';

  factory _$_MedicineApplication.fromJson(Map<String, dynamic> json) =>
      _$$_MedicineApplicationFromJson(json);

  @override
  final String aplication;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Method.medicineAplication(aplication: $aplication)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MedicineApplication &&
            const DeepCollectionEquality()
                .equals(other.aplication, aplication));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(aplication));

  @JsonKey(ignore: true)
  @override
  _$$_MedicineApplicationCopyWith<_$_MedicineApplication> get copyWith =>
      __$$_MedicineApplicationCopyWithImpl<_$_MedicineApplication>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String aplication) medicineAplication,
    required TResult Function(String name, double value, String unit)
        medicineDosis,
  }) {
    return medicineAplication(aplication);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String aplication)? medicineAplication,
    TResult Function(String name, double value, String unit)? medicineDosis,
  }) {
    return medicineAplication?.call(aplication);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String aplication)? medicineAplication,
    TResult Function(String name, double value, String unit)? medicineDosis,
    required TResult orElse(),
  }) {
    if (medicineAplication != null) {
      return medicineAplication(aplication);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MedicineApplication value) medicineAplication,
    required TResult Function(_MedicineDosis value) medicineDosis,
  }) {
    return medicineAplication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineAplication,
    TResult Function(_MedicineDosis value)? medicineDosis,
  }) {
    return medicineAplication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineAplication,
    TResult Function(_MedicineDosis value)? medicineDosis,
    required TResult orElse(),
  }) {
    if (medicineAplication != null) {
      return medicineAplication(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_MedicineApplicationToJson(this);
  }
}

abstract class _MedicineApplication implements Method {
  const factory _MedicineApplication(final String aplication) =
      _$_MedicineApplication;

  factory _MedicineApplication.fromJson(Map<String, dynamic> json) =
      _$_MedicineApplication.fromJson;

  String get aplication => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_MedicineApplicationCopyWith<_$_MedicineApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MedicineDosisCopyWith<$Res> {
  factory _$$_MedicineDosisCopyWith(
          _$_MedicineDosis value, $Res Function(_$_MedicineDosis) then) =
      __$$_MedicineDosisCopyWithImpl<$Res>;
  $Res call({String name, double value, String unit});
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
    Object? value = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$_MedicineDosis(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MedicineDosis implements _MedicineDosis {
  const _$_MedicineDosis(
      {required this.name,
      required this.value,
      required this.unit,
      final String? $type})
      : $type = $type ?? 'medicineDosis';

  factory _$_MedicineDosis.fromJson(Map<String, dynamic> json) =>
      _$$_MedicineDosisFromJson(json);

  @override
  final String name;
  @override
  final double value;
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
            other is _$_MedicineDosis &&
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
  _$$_MedicineDosisCopyWith<_$_MedicineDosis> get copyWith =>
      __$$_MedicineDosisCopyWithImpl<_$_MedicineDosis>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String aplication) medicineAplication,
    required TResult Function(String name, double value, String unit)
        medicineDosis,
  }) {
    return medicineDosis(name, value, unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String aplication)? medicineAplication,
    TResult Function(String name, double value, String unit)? medicineDosis,
  }) {
    return medicineDosis?.call(name, value, unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String aplication)? medicineAplication,
    TResult Function(String name, double value, String unit)? medicineDosis,
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
    required TResult Function(_MedicineApplication value) medicineAplication,
    required TResult Function(_MedicineDosis value) medicineDosis,
  }) {
    return medicineDosis(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineAplication,
    TResult Function(_MedicineDosis value)? medicineDosis,
  }) {
    return medicineDosis?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MedicineApplication value)? medicineAplication,
    TResult Function(_MedicineDosis value)? medicineDosis,
    required TResult orElse(),
  }) {
    if (medicineDosis != null) {
      return medicineDosis(this);
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
      required final double value,
      required final String unit}) = _$_MedicineDosis;

  factory _MedicineDosis.fromJson(Map<String, dynamic> json) =
      _$_MedicineDosis.fromJson;

  String get name => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_MedicineDosisCopyWith<_$_MedicineDosis> get copyWith =>
      throw _privateConstructorUsedError;
}
