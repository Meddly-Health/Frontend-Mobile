// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'consumption_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsumptionRule _$ConsumptionRuleFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'needIt':
      return _NeedIt.fromJson(json);
    case 'everyDay':
      return _EveryDay.fromJson(json);
    case 'everyXDays':
      return _EveryXDays.fromJson(json);
    case 'specificDays':
      return _SpecificDays.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ConsumptionRule',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ConsumptionRule {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIt,
    required TResult Function() everyDay,
    required TResult Function(int days) everyXDays,
    required TResult Function(List<int> days) specificDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NeedIt value) needIt,
    required TResult Function(_EveryDay value) everyDay,
    required TResult Function(_EveryXDays value) everyXDays,
    required TResult Function(_SpecificDays value) specificDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionRuleCopyWith<$Res> {
  factory $ConsumptionRuleCopyWith(
          ConsumptionRule value, $Res Function(ConsumptionRule) then) =
      _$ConsumptionRuleCopyWithImpl<$Res>;
}

/// @nodoc
class _$ConsumptionRuleCopyWithImpl<$Res>
    implements $ConsumptionRuleCopyWith<$Res> {
  _$ConsumptionRuleCopyWithImpl(this._value, this._then);

  final ConsumptionRule _value;
  // ignore: unused_field
  final $Res Function(ConsumptionRule) _then;
}

/// @nodoc
abstract class _$$_NeedItCopyWith<$Res> {
  factory _$$_NeedItCopyWith(_$_NeedIt value, $Res Function(_$_NeedIt) then) =
      __$$_NeedItCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NeedItCopyWithImpl<$Res> extends _$ConsumptionRuleCopyWithImpl<$Res>
    implements _$$_NeedItCopyWith<$Res> {
  __$$_NeedItCopyWithImpl(_$_NeedIt _value, $Res Function(_$_NeedIt) _then)
      : super(_value, (v) => _then(v as _$_NeedIt));

  @override
  _$_NeedIt get _value => super._value as _$_NeedIt;
}

/// @nodoc
@JsonSerializable()
class _$_NeedIt implements _NeedIt {
  const _$_NeedIt({final String? $type}) : $type = $type ?? 'needIt';

  factory _$_NeedIt.fromJson(Map<String, dynamic> json) =>
      _$$_NeedItFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ConsumptionRule.needIt()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NeedIt);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIt,
    required TResult Function() everyDay,
    required TResult Function(int days) everyXDays,
    required TResult Function(List<int> days) specificDays,
  }) {
    return needIt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
  }) {
    return needIt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
    required TResult orElse(),
  }) {
    if (needIt != null) {
      return needIt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NeedIt value) needIt,
    required TResult Function(_EveryDay value) everyDay,
    required TResult Function(_EveryXDays value) everyXDays,
    required TResult Function(_SpecificDays value) specificDays,
  }) {
    return needIt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
  }) {
    return needIt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
    required TResult orElse(),
  }) {
    if (needIt != null) {
      return needIt(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NeedItToJson(this);
  }
}

abstract class _NeedIt implements ConsumptionRule {
  const factory _NeedIt() = _$_NeedIt;

  factory _NeedIt.fromJson(Map<String, dynamic> json) = _$_NeedIt.fromJson;
}

/// @nodoc
abstract class _$$_EveryDayCopyWith<$Res> {
  factory _$$_EveryDayCopyWith(
          _$_EveryDay value, $Res Function(_$_EveryDay) then) =
      __$$_EveryDayCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EveryDayCopyWithImpl<$Res>
    extends _$ConsumptionRuleCopyWithImpl<$Res>
    implements _$$_EveryDayCopyWith<$Res> {
  __$$_EveryDayCopyWithImpl(
      _$_EveryDay _value, $Res Function(_$_EveryDay) _then)
      : super(_value, (v) => _then(v as _$_EveryDay));

  @override
  _$_EveryDay get _value => super._value as _$_EveryDay;
}

/// @nodoc
@JsonSerializable()
class _$_EveryDay implements _EveryDay {
  const _$_EveryDay({final String? $type}) : $type = $type ?? 'everyDay';

  factory _$_EveryDay.fromJson(Map<String, dynamic> json) =>
      _$$_EveryDayFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ConsumptionRule.everyDay()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EveryDay);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIt,
    required TResult Function() everyDay,
    required TResult Function(int days) everyXDays,
    required TResult Function(List<int> days) specificDays,
  }) {
    return everyDay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
  }) {
    return everyDay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
    required TResult orElse(),
  }) {
    if (everyDay != null) {
      return everyDay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NeedIt value) needIt,
    required TResult Function(_EveryDay value) everyDay,
    required TResult Function(_EveryXDays value) everyXDays,
    required TResult Function(_SpecificDays value) specificDays,
  }) {
    return everyDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
  }) {
    return everyDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
    required TResult orElse(),
  }) {
    if (everyDay != null) {
      return everyDay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_EveryDayToJson(this);
  }
}

abstract class _EveryDay implements ConsumptionRule {
  const factory _EveryDay() = _$_EveryDay;

  factory _EveryDay.fromJson(Map<String, dynamic> json) = _$_EveryDay.fromJson;
}

/// @nodoc
abstract class _$$_EveryXDaysCopyWith<$Res> {
  factory _$$_EveryXDaysCopyWith(
          _$_EveryXDays value, $Res Function(_$_EveryXDays) then) =
      __$$_EveryXDaysCopyWithImpl<$Res>;
  $Res call({int days});
}

/// @nodoc
class __$$_EveryXDaysCopyWithImpl<$Res>
    extends _$ConsumptionRuleCopyWithImpl<$Res>
    implements _$$_EveryXDaysCopyWith<$Res> {
  __$$_EveryXDaysCopyWithImpl(
      _$_EveryXDays _value, $Res Function(_$_EveryXDays) _then)
      : super(_value, (v) => _then(v as _$_EveryXDays));

  @override
  _$_EveryXDays get _value => super._value as _$_EveryXDays;

  @override
  $Res call({
    Object? days = freezed,
  }) {
    return _then(_$_EveryXDays(
      days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EveryXDays implements _EveryXDays {
  const _$_EveryXDays(this.days, {final String? $type})
      : $type = $type ?? 'everyXDays';

  factory _$_EveryXDays.fromJson(Map<String, dynamic> json) =>
      _$$_EveryXDaysFromJson(json);

  @override
  final int days;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ConsumptionRule.everyXDays(days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EveryXDays &&
            const DeepCollectionEquality().equals(other.days, days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(days));

  @JsonKey(ignore: true)
  @override
  _$$_EveryXDaysCopyWith<_$_EveryXDays> get copyWith =>
      __$$_EveryXDaysCopyWithImpl<_$_EveryXDays>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIt,
    required TResult Function() everyDay,
    required TResult Function(int days) everyXDays,
    required TResult Function(List<int> days) specificDays,
  }) {
    return everyXDays(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
  }) {
    return everyXDays?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
    required TResult orElse(),
  }) {
    if (everyXDays != null) {
      return everyXDays(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NeedIt value) needIt,
    required TResult Function(_EveryDay value) everyDay,
    required TResult Function(_EveryXDays value) everyXDays,
    required TResult Function(_SpecificDays value) specificDays,
  }) {
    return everyXDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
  }) {
    return everyXDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
    required TResult orElse(),
  }) {
    if (everyXDays != null) {
      return everyXDays(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_EveryXDaysToJson(this);
  }
}

abstract class _EveryXDays implements ConsumptionRule {
  const factory _EveryXDays(final int days) = _$_EveryXDays;

  factory _EveryXDays.fromJson(Map<String, dynamic> json) =
      _$_EveryXDays.fromJson;

  int get days => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_EveryXDaysCopyWith<_$_EveryXDays> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SpecificDaysCopyWith<$Res> {
  factory _$$_SpecificDaysCopyWith(
          _$_SpecificDays value, $Res Function(_$_SpecificDays) then) =
      __$$_SpecificDaysCopyWithImpl<$Res>;
  $Res call({List<int> days});
}

/// @nodoc
class __$$_SpecificDaysCopyWithImpl<$Res>
    extends _$ConsumptionRuleCopyWithImpl<$Res>
    implements _$$_SpecificDaysCopyWith<$Res> {
  __$$_SpecificDaysCopyWithImpl(
      _$_SpecificDays _value, $Res Function(_$_SpecificDays) _then)
      : super(_value, (v) => _then(v as _$_SpecificDays));

  @override
  _$_SpecificDays get _value => super._value as _$_SpecificDays;

  @override
  $Res call({
    Object? days = freezed,
  }) {
    return _then(_$_SpecificDays(
      days == freezed
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecificDays implements _SpecificDays {
  const _$_SpecificDays(final List<int> days, {final String? $type})
      : _days = days,
        $type = $type ?? 'specificDays';

  factory _$_SpecificDays.fromJson(Map<String, dynamic> json) =>
      _$$_SpecificDaysFromJson(json);

  final List<int> _days;
  @override
  List<int> get days {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ConsumptionRule.specificDays(days: $days)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecificDays &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  _$$_SpecificDaysCopyWith<_$_SpecificDays> get copyWith =>
      __$$_SpecificDaysCopyWithImpl<_$_SpecificDays>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIt,
    required TResult Function() everyDay,
    required TResult Function(int days) everyXDays,
    required TResult Function(List<int> days) specificDays,
  }) {
    return specificDays(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
  }) {
    return specificDays?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIt,
    TResult Function()? everyDay,
    TResult Function(int days)? everyXDays,
    TResult Function(List<int> days)? specificDays,
    required TResult orElse(),
  }) {
    if (specificDays != null) {
      return specificDays(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NeedIt value) needIt,
    required TResult Function(_EveryDay value) everyDay,
    required TResult Function(_EveryXDays value) everyXDays,
    required TResult Function(_SpecificDays value) specificDays,
  }) {
    return specificDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
  }) {
    return specificDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NeedIt value)? needIt,
    TResult Function(_EveryDay value)? everyDay,
    TResult Function(_EveryXDays value)? everyXDays,
    TResult Function(_SpecificDays value)? specificDays,
    required TResult orElse(),
  }) {
    if (specificDays != null) {
      return specificDays(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecificDaysToJson(this);
  }
}

abstract class _SpecificDays implements ConsumptionRule {
  const factory _SpecificDays(final List<int> days) = _$_SpecificDays;

  factory _SpecificDays.fromJson(Map<String, dynamic> json) =
      _$_SpecificDays.fromJson;

  List<int> get days => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_SpecificDaysCopyWith<_$_SpecificDays> get copyWith =>
      throw _privateConstructorUsedError;
}
