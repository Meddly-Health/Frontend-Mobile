// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'day_consumption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DayConsumption _$DayConsumptionFromJson(Map<String, dynamic> json) {
  return _DayConsumption.fromJson(json);
}

/// @nodoc
mixin _$DayConsumption {
  DateTime get date => throw _privateConstructorUsedError;
  List<Consumption> get consumptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayConsumptionCopyWith<DayConsumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayConsumptionCopyWith<$Res> {
  factory $DayConsumptionCopyWith(
          DayConsumption value, $Res Function(DayConsumption) then) =
      _$DayConsumptionCopyWithImpl<$Res>;
  $Res call({DateTime date, List<Consumption> consumptions});
}

/// @nodoc
class _$DayConsumptionCopyWithImpl<$Res>
    implements $DayConsumptionCopyWith<$Res> {
  _$DayConsumptionCopyWithImpl(this._value, this._then);

  final DayConsumption _value;
  // ignore: unused_field
  final $Res Function(DayConsumption) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? consumptions = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumptions: consumptions == freezed
          ? _value.consumptions
          : consumptions // ignore: cast_nullable_to_non_nullable
              as List<Consumption>,
    ));
  }
}

/// @nodoc
abstract class _$$_DayConsumptionCopyWith<$Res>
    implements $DayConsumptionCopyWith<$Res> {
  factory _$$_DayConsumptionCopyWith(
          _$_DayConsumption value, $Res Function(_$_DayConsumption) then) =
      __$$_DayConsumptionCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, List<Consumption> consumptions});
}

/// @nodoc
class __$$_DayConsumptionCopyWithImpl<$Res>
    extends _$DayConsumptionCopyWithImpl<$Res>
    implements _$$_DayConsumptionCopyWith<$Res> {
  __$$_DayConsumptionCopyWithImpl(
      _$_DayConsumption _value, $Res Function(_$_DayConsumption) _then)
      : super(_value, (v) => _then(v as _$_DayConsumption));

  @override
  _$_DayConsumption get _value => super._value as _$_DayConsumption;

  @override
  $Res call({
    Object? date = freezed,
    Object? consumptions = freezed,
  }) {
    return _then(_$_DayConsumption(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumptions: consumptions == freezed
          ? _value._consumptions
          : consumptions // ignore: cast_nullable_to_non_nullable
              as List<Consumption>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DayConsumption implements _DayConsumption {
  const _$_DayConsumption(
      {required this.date, required final List<Consumption> consumptions})
      : _consumptions = consumptions;

  factory _$_DayConsumption.fromJson(Map<String, dynamic> json) =>
      _$$_DayConsumptionFromJson(json);

  @override
  final DateTime date;
  final List<Consumption> _consumptions;
  @override
  List<Consumption> get consumptions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumptions);
  }

  @override
  String toString() {
    return 'DayConsumption(date: $date, consumptions: $consumptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayConsumption &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other._consumptions, _consumptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(_consumptions));

  @JsonKey(ignore: true)
  @override
  _$$_DayConsumptionCopyWith<_$_DayConsumption> get copyWith =>
      __$$_DayConsumptionCopyWithImpl<_$_DayConsumption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayConsumptionToJson(this);
  }
}

abstract class _DayConsumption implements DayConsumption {
  const factory _DayConsumption(
      {required final DateTime date,
      required final List<Consumption> consumptions}) = _$_DayConsumption;

  factory _DayConsumption.fromJson(Map<String, dynamic> json) =
      _$_DayConsumption.fromJson;

  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  List<Consumption> get consumptions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DayConsumptionCopyWith<_$_DayConsumption> get copyWith =>
      throw _privateConstructorUsedError;
}
