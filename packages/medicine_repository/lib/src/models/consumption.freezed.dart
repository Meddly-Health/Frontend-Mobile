// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'consumption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Consumption _$ConsumptionFromJson(Map<String, dynamic> json) {
  return _Consumption.fromJson(json);
}

/// @nodoc
mixin _$Consumption {
  bool get consumed => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsumptionCopyWith<Consumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionCopyWith<$Res> {
  factory $ConsumptionCopyWith(
          Consumption value, $Res Function(Consumption) then) =
      _$ConsumptionCopyWithImpl<$Res>;
  $Res call({bool consumed, DateTime date});
}

/// @nodoc
class _$ConsumptionCopyWithImpl<$Res> implements $ConsumptionCopyWith<$Res> {
  _$ConsumptionCopyWithImpl(this._value, this._then);

  final Consumption _value;
  // ignore: unused_field
  final $Res Function(Consumption) _then;

  @override
  $Res call({
    Object? consumed = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      consumed: consumed == freezed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as bool,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_ConsumptionCopyWith<$Res>
    implements $ConsumptionCopyWith<$Res> {
  factory _$$_ConsumptionCopyWith(
          _$_Consumption value, $Res Function(_$_Consumption) then) =
      __$$_ConsumptionCopyWithImpl<$Res>;
  @override
  $Res call({bool consumed, DateTime date});
}

/// @nodoc
class __$$_ConsumptionCopyWithImpl<$Res> extends _$ConsumptionCopyWithImpl<$Res>
    implements _$$_ConsumptionCopyWith<$Res> {
  __$$_ConsumptionCopyWithImpl(
      _$_Consumption _value, $Res Function(_$_Consumption) _then)
      : super(_value, (v) => _then(v as _$_Consumption));

  @override
  _$_Consumption get _value => super._value as _$_Consumption;

  @override
  $Res call({
    Object? consumed = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_Consumption(
      consumed: consumed == freezed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as bool,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Consumption implements _Consumption {
  const _$_Consumption({required this.consumed, required this.date});

  factory _$_Consumption.fromJson(Map<String, dynamic> json) =>
      _$$_ConsumptionFromJson(json);

  @override
  final bool consumed;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Consumption(consumed: $consumed, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Consumption &&
            const DeepCollectionEquality().equals(other.consumed, consumed) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(consumed),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_ConsumptionCopyWith<_$_Consumption> get copyWith =>
      __$$_ConsumptionCopyWithImpl<_$_Consumption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConsumptionToJson(this);
  }
}

abstract class _Consumption implements Consumption {
  const factory _Consumption(
      {required final bool consumed,
      required final DateTime date}) = _$_Consumption;

  factory _Consumption.fromJson(Map<String, dynamic> json) =
      _$_Consumption.fromJson;

  @override
  bool get consumed => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConsumptionCopyWith<_$_Consumption> get copyWith =>
      throw _privateConstructorUsedError;
}
