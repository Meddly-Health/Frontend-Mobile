import 'package:dartz/dartz.dart';

import 'api/api.dart';
import 'models/models.dart';

class TreatmentRepository {
  final TreatmentApi _treatmentApi;

  TreatmentRepository({required TreatmentApi medicineApi})
      : _treatmentApi = medicineApi;

  /// Update a medicine.
  ///
  /// Returns a [Medicine] if the medicine was updated.
  /// Throws a [TreatmentException] if the medicine could not be updated.
  Future<Either<TreatmentException, Treatment>> updateTreatment(
          Treatment treatment) async =>
      await _treatmentApi.updateTreatment(treatment);

  /// Delete a medicine.
  ///
  /// Returns a [Nothing] if the medicine was deleted.
  /// Throws a [TreatmentException] if the medicine could not be deleted.
  Future<Either<TreatmentException, Nothing>> deleteTreatment(
          String id) async =>
      await _treatmentApi.deleteTreatment(id);

  /// Create a medicine.
  ///
  /// Returns a [Medicine] if the medicine was created.
  /// Throws a [TreatmentException] if the medicine could not be created.
  Future<Either<TreatmentException, Treatment>> addTreatment(
          Treatment treatment) async =>
      await _treatmentApi.addTreatment(treatment);

  /// Get all medicines.
  ///
  /// Returns a [List<Medicine>] if the medicines were found.
  /// Throws a [TreatmentException] if the medicines could not be retrieved.
  Future<Either<TreatmentException, List<Treatment>>> getTreatments() async =>
      await _treatmentApi.getTreatments();

  Future<Either<TreatmentException, Nothing>> addConsumption(
          String id, DateTime dateTime) async =>
      await _treatmentApi.addConsumption(id, dateTime);
}
