import 'package:freezed_annotation/freezed_annotation.dart';

part 'method.freezed.dart';
part 'method.g.dart';

@freezed
class Method with _$Method {
  const factory Method.medicineDosis(
      {required String name,
      required int value,
      required String unit}) = _MedicineApplication;
  const factory Method.medicineApplication(
      {required String name, String? description}) = _MedicineDosis;

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);
}
