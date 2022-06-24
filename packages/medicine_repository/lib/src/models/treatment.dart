import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medicine_repository/src/models/models.dart';

part 'treatment.freezed.dart';
part 'treatment.g.dart';

@freezed
class Treatment with _$Treatment {
  const factory Treatment({
    required String id,
    required String name,
    required Medicine medicine,
    required int stock,
    @JsonKey(name: 'stock_warning') required int? stockWarning,
    required TreatmentIndication treatmentIndication,
  }) = _Treatment;

  factory Treatment.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFromJson(json);
}
