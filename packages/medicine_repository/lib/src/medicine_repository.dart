import 'package:dartz/dartz.dart';

import 'api/api.dart';
import 'models/models.dart';

class MedicineRepository {
  final MedicineApi _medicineApi;

  MedicineRepository({required MedicineApi medicineApi})
      : _medicineApi = medicineApi;

  /// Get a medicine by id.
  ///
  /// Returns a [Medicine] if the medicine was found.
  /// Throws a [MedicineException] if the medicine could not be retrieved.
  Future<Either<MedicineException, Medicine>> getMedicine(String id) async =>
      await _medicineApi.getMedicine(id);

  /// Update a medicine.
  ///
  /// Returns a [Medicine] if the medicine was updated.
  /// Throws a [MedicineException] if the medicine could not be updated.
  Future<Either<MedicineException, Medicine>> updateMedicine(
          Medicine medicine) async =>
      await _medicineApi.updateMedicine(medicine);

  /// Delete a medicine.
  ///
  /// Returns a [Nothing] if the medicine was deleted.
  /// Throws a [MedicineException] if the medicine could not be deleted.
  Future<Either<MedicineException, Nothing>> deleteMedicine(String id) async =>
      await _medicineApi.deleteMedicine(id);

  /// Create a medicine.
  ///
  /// Returns a [Medicine] if the medicine was created.
  /// Throws a [MedicineException] if the medicine could not be created.
  Future<Either<MedicineException, Medicine>> createMedicine(
          Medicine medicine) async =>
      await _medicineApi.createMedicine(medicine);

  /// Get all medicines.
  ///
  /// Returns a [List<Medicine>] if the medicines were found.
  /// Throws a [MedicineException] if the medicines could not be retrieved.
  Future<Either<MedicineException, List<Medicine>>> getMedicines() async =>
      await _medicineApi.getMedicines();
}
