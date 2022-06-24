import 'package:freezed_annotation/freezed_annotation.dart';

part 'method.freezed.dart';
part 'method.g.dart';

@freezed
class Method with _$Method {
  const factory Method.medicineAplication(String aplication) =
      _MedicineApplication;
  const factory Method.medicineDosis(
      {required String name,
      required double value,
      required String unit}) = _MedicineDosis;

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
}
