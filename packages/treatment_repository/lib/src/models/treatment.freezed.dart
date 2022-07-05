// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'treatment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Treatment _$TreatmentFromJson(Map<String, dynamic> json) {
  return _Treatment.fromJson(json);
}

/// @nodoc
mixin _$Treatment {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Medicine get medicine => throw _privateConstructorUsedError;
  int get stock => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_warning')
  int? get stockWarning => throw _privateConstructorUsedError;
  @JsonKey(name: 'treatment_indication')
  TreatmentIndication get treatmentIndication =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreatmentCopyWith<Treatment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentCopyWith<$Res> {
  factory $TreatmentCopyWith(Treatment value, $Res Function(Treatment) then) =
      _$TreatmentCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      Medicine medicine,
      int stock,
      @JsonKey(name: 'stock_warning')
          int? stockWarning,
      @JsonKey(name: 'treatment_indication')
          TreatmentIndication treatmentIndication});

  $MedicineCopyWith<$Res> get medicine;
  $TreatmentIndicationCopyWith<$Res> get treatmentIndication;
}

/// @nodoc
class _$TreatmentCopyWithImpl<$Res> implements $TreatmentCopyWith<$Res> {
  _$TreatmentCopyWithImpl(this._value, this._then);

  final Treatment _value;
  // ignore: unused_field
  final $Res Function(Treatment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? medicine = freezed,
    Object? stock = freezed,
    Object? stockWarning = freezed,
    Object? treatmentIndication = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      medicine: medicine == freezed
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as Medicine,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      stockWarning: stockWarning == freezed
          ? _value.stockWarning
          : stockWarning // ignore: cast_nullable_to_non_nullable
              as int?,
      treatmentIndication: treatmentIndication == freezed
          ? _value.treatmentIndication
          : treatmentIndication // ignore: cast_nullable_to_non_nullable
              as TreatmentIndication,
    ));
  }

  @override
  $MedicineCopyWith<$Res> get medicine {
    return $MedicineCopyWith<$Res>(_value.medicine, (value) {
      return _then(_value.copyWith(medicine: value));
    });
  }

  @override
  $TreatmentIndicationCopyWith<$Res> get treatmentIndication {
    return $TreatmentIndicationCopyWith<$Res>(_value.treatmentIndication,
        (value) {
      return _then(_value.copyWith(treatmentIndication: value));
    });
  }
}

/// @nodoc
abstract class _$$_TreatmentCopyWith<$Res> implements $TreatmentCopyWith<$Res> {
  factory _$$_TreatmentCopyWith(
          _$_Treatment value, $Res Function(_$_Treatment) then) =
      __$$_TreatmentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      Medicine medicine,
      int stock,
      @JsonKey(name: 'stock_warning')
          int? stockWarning,
      @JsonKey(name: 'treatment_indication')
          TreatmentIndication treatmentIndication});

  @override
  $MedicineCopyWith<$Res> get medicine;
  @override
  $TreatmentIndicationCopyWith<$Res> get treatmentIndication;
}

/// @nodoc
class __$$_TreatmentCopyWithImpl<$Res> extends _$TreatmentCopyWithImpl<$Res>
    implements _$$_TreatmentCopyWith<$Res> {
  __$$_TreatmentCopyWithImpl(
      _$_Treatment _value, $Res Function(_$_Treatment) _then)
      : super(_value, (v) => _then(v as _$_Treatment));

  @override
  _$_Treatment get _value => super._value as _$_Treatment;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? medicine = freezed,
    Object? stock = freezed,
    Object? stockWarning = freezed,
    Object? treatmentIndication = freezed,
  }) {
    return _then(_$_Treatment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      medicine: medicine == freezed
          ? _value.medicine
          : medicine // ignore: cast_nullable_to_non_nullable
              as Medicine,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      stockWarning: stockWarning == freezed
          ? _value.stockWarning
          : stockWarning // ignore: cast_nullable_to_non_nullable
              as int?,
      treatmentIndication: treatmentIndication == freezed
          ? _value.treatmentIndication
          : treatmentIndication // ignore: cast_nullable_to_non_nullable
              as TreatmentIndication,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Treatment implements _Treatment {
  const _$_Treatment(
      {required this.id,
      required this.name,
      required this.medicine,
      required this.stock,
      @JsonKey(name: 'stock_warning')
          required this.stockWarning,
      @JsonKey(name: 'treatment_indication')
          required this.treatmentIndication});

  factory _$_Treatment.fromJson(Map<String, dynamic> json) =>
      _$$_TreatmentFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Medicine medicine;
  @override
  final int stock;
  @override
  @JsonKey(name: 'stock_warning')
  final int? stockWarning;
  @override
  @JsonKey(name: 'treatment_indication')
  final TreatmentIndication treatmentIndication;

  @override
  String toString() {
    return 'Treatment(id: $id, name: $name, medicine: $medicine, stock: $stock, stockWarning: $stockWarning, treatmentIndication: $treatmentIndication)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Treatment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.medicine, medicine) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality()
                .equals(other.stockWarning, stockWarning) &&
            const DeepCollectionEquality()
                .equals(other.treatmentIndication, treatmentIndication));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(medicine),
      const DeepCollectionEquality().hash(stock),
      const DeepCollectionEquality().hash(stockWarning),
      const DeepCollectionEquality().hash(treatmentIndication));

  @JsonKey(ignore: true)
  @override
  _$$_TreatmentCopyWith<_$_Treatment> get copyWith =>
      __$$_TreatmentCopyWithImpl<_$_Treatment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TreatmentToJson(this);
  }
}

abstract class _Treatment implements Treatment {
  const factory _Treatment(
          {required final String id,
          required final String name,
          required final Medicine medicine,
          required final int stock,
          @JsonKey(name: 'stock_warning')
              required final int? stockWarning,
          @JsonKey(name: 'treatment_indication')
              required final TreatmentIndication treatmentIndication}) =
      _$_Treatment;

  factory _Treatment.fromJson(Map<String, dynamic> json) =
      _$_Treatment.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Medicine get medicine => throw _privateConstructorUsedError;
  @override
  int get stock => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'stock_warning')
  int? get stockWarning => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'treatment_indication')
  TreatmentIndication get treatmentIndication =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TreatmentCopyWith<_$_Treatment> get copyWith =>
      throw _privateConstructorUsedError;
}
