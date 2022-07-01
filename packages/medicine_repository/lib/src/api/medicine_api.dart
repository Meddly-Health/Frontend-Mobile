import 'package:dartz/dartz.dart';
import 'package:medicine_repository/src/models/medicine.dart';

abstract class MedicineApi {
  Future<Either<MedicineException, Medicine>> getMedicine(String id);

  Future<Either<MedicineException, Medicine>> updateMedicine(Medicine medicine);

  Future<Either<MedicineException, Nothing>> deleteMedicine(String id);

  Future<Either<MedicineException, Medicine>> createMedicine(Medicine medicine);

  Future<Either<MedicineException, List<Medicine>>> getMedicines();
}

class MedicineException with Exception {
  MedicineException(this.message);

  final String message;
}

class Nothing {}
