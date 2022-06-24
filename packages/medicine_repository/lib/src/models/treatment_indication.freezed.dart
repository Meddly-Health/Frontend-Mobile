// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'treatment_indication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TreatmentIndication _$TreatmentIndicationFromJson(Map<String, dynamic> json) {
  return _TreatmentIndication.fromJson(json);
}

/// @nodoc
mixin _$TreatmentIndication {
  String? get instructions => throw _privateConstructorUsedError;
  List<DayConsumption> get history => throw _privateConstructorUsedError;
  @JsonKey(name: 'consumption_rule')
  ConsumptionRule get consumptionRule => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreatmentIndicationCopyWith<TreatmentIndication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentIndicationCopyWith<$Res> {
  factory $TreatmentIndicationCopyWith(
          TreatmentIndication value, $Res Function(TreatmentIndication) then) =
      _$TreatmentIndicationCopyWithImpl<$Res>;
  $Res call(
      {String? instructions,
      List<DayConsumption> history,
      @JsonKey(name: 'consumption_rule') ConsumptionRule consumptionRule,
      DateTime start,
      DateTime? end});

  $ConsumptionRuleCopyWith<$Res> get consumptionRule;
}

/// @nodoc
class _$TreatmentIndicationCopyWithImpl<$Res>
    implements $TreatmentIndicationCopyWith<$Res> {
  _$TreatmentIndicationCopyWithImpl(this._value, this._then);

  final TreatmentIndication _value;
  // ignore: unused_field
  final $Res Function(TreatmentIndication) _then;

  @override
  $Res call({
    Object? instructions = freezed,
    Object? history = freezed,
    Object? consumptionRule = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      instructions: instructions == freezed
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      history: history == freezed
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<DayConsumption>,
      consumptionRule: consumptionRule == freezed
          ? _value.consumptionRule
          : consumptionRule // ignore: cast_nullable_to_non_nullable
              as ConsumptionRule,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $ConsumptionRuleCopyWith<$Res> get consumptionRule {
    return $ConsumptionRuleCopyWith<$Res>(_value.consumptionRule, (value) {
      return _then(_value.copyWith(consumptionRule: value));
    });
  }
}

/// @nodoc
abstract class _$$_TreatmentIndicationCopyWith<$Res>
    implements $TreatmentIndicationCopyWith<$Res> {
  factory _$$_TreatmentIndicationCopyWith(_$_TreatmentIndication value,
          $Res Function(_$_TreatmentIndication) then) =
      __$$_TreatmentIndicationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? instructions,
      List<DayConsumption> history,
      @JsonKey(name: 'consumption_rule') ConsumptionRule consumptionRule,
      DateTime start,
      DateTime? end});

  @override
  $ConsumptionRuleCopyWith<$Res> get consumptionRule;
}

/// @nodoc
class __$$_TreatmentIndicationCopyWithImpl<$Res>
    extends _$TreatmentIndicationCopyWithImpl<$Res>
    implements _$$_TreatmentIndicationCopyWith<$Res> {
  __$$_TreatmentIndicationCopyWithImpl(_$_TreatmentIndication _value,
      $Res Function(_$_TreatmentIndication) _then)
      : super(_value, (v) => _then(v as _$_TreatmentIndication));

  @override
  _$_TreatmentIndication get _value => super._value as _$_TreatmentIndication;

  @override
  $Res call({
    Object? instructions = freezed,
    Object? history = freezed,
    Object? consumptionRule = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_TreatmentIndication(
      instructions: instructions == freezed
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      history: history == freezed
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<DayConsumption>,
      consumptionRule: consumptionRule == freezed
          ? _value.consumptionRule
          : consumptionRule // ignore: cast_nullable_to_non_nullable
              as ConsumptionRule,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TreatmentIndication implements _TreatmentIndication {
  const _$_TreatmentIndication(
      {this.instructions,
      required final List<DayConsumption> history,
      @JsonKey(name: 'consumption_rule') required this.consumptionRule,
      required this.start,
      required this.end})
      : _history = history;

  factory _$_TreatmentIndication.fromJson(Map<String, dynamic> json) =>
      _$$_TreatmentIndicationFromJson(json);

  @override
  final String? instructions;
  final List<DayConsumption> _history;
  @override
  List<DayConsumption> get history {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  @JsonKey(name: 'consumption_rule')
  final ConsumptionRule consumptionRule;
  @override
  final DateTime start;
  @override
  final DateTime? end;

  @override
  String toString() {
    return 'TreatmentIndication(instructions: $instructions, history: $history, consumptionRule: $consumptionRule, start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TreatmentIndication &&
            const DeepCollectionEquality()
                .equals(other.instructions, instructions) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            const DeepCollectionEquality()
                .equals(other.consumptionRule, consumptionRule) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(instructions),
      const DeepCollectionEquality().hash(_history),
      const DeepCollectionEquality().hash(consumptionRule),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end));

  @JsonKey(ignore: true)
  @override
  _$$_TreatmentIndicationCopyWith<_$_TreatmentIndication> get copyWith =>
      __$$_TreatmentIndicationCopyWithImpl<_$_TreatmentIndication>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TreatmentIndicationToJson(this);
  }
}

abstract class _TreatmentIndication implements TreatmentIndication {
  const factory _TreatmentIndication(
      {final String? instructions,
      required final List<DayConsumption> history,
      @JsonKey(name: 'consumption_rule')
          required final ConsumptionRule consumptionRule,
      required final DateTime start,
      required final DateTime? end}) = _$_TreatmentIndication;

  factory _TreatmentIndication.fromJson(Map<String, dynamic> json) =
      _$_TreatmentIndication.fromJson;

  @override
  String? get instructions => throw _privateConstructorUsedError;
  @override
  List<DayConsumption> get history => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'consumption_rule')
  ConsumptionRule get consumptionRule => throw _privateConstructorUsedError;
  @override
  DateTime get start => throw _privateConstructorUsedError;
  @override
  DateTime? get end => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TreatmentIndicationCopyWith<_$_TreatmentIndication> get copyWith =>
      throw _privateConstructorUsedError;
}
