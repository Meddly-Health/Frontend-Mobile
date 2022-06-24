import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine.freezed.dart';
part 'medicine.g.dart';

@freezed
class Medicine with _$Medicine {
  const factory Medicine({
    required String name,
    required String icon,
  }) = _Medicine;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
}
