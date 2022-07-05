import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:treatment_repository/treatment_repository.dart';

part 'medicine.freezed.dart';
part 'medicine.g.dart';

@freezed
class Medicine with _$Medicine {
  @JsonSerializable(explicitToJson: true)
  const factory Medicine({
    required String name,
    required String icon,
    required Method method,
  }) = _Medicine;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
}
