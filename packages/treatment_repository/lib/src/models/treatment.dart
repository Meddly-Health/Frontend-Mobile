import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:treatment_repository/src/models/treatment_indication.dart';

import 'medicine.dart';

part 'treatment.freezed.dart';
part 'treatment.g.dart';

@freezed
class Treatment with _$Treatment {
  @JsonSerializable(explicitToJson: true)
  const factory Treatment({
    required String id,
    required String name,
    required Medicine medicine,
    required int stock,
    @JsonKey(name: 'stock_warning') required int? stockWarning,
    @JsonKey(name: 'treatment_indication')
        required TreatmentIndication treatmentIndication,
  }) = _Treatment;

  factory Treatment.fromJson(Map<String, dynamic> json) =>
      _$TreatmentFromJson(json);
}
