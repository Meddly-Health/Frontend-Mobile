import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../treatment_repository.dart';

abstract class TreatmentApi {
  Future<Either<TreatmentException, List<Treatment>>> getTreatments();

  Future<Either<TreatmentException, Treatment>> addTreatment(
      Treatment treatment);

  Future<Either<TreatmentException, Treatment>> updateTreatment(
      Treatment treatment);

  Future<Either<TreatmentException, Nothing>> deleteTreatment(String id);

  Future<Either<TreatmentException, Nothing>> addConsumption(
      String id, DateTime dateTime);

  Future<Either<TreatmentException, Nothing>> deleteConsumption(String id);
}

class TreatmentException implements Exception {
  String message;
  int? statusCode;

  TreatmentException(
      {this.message = 'Excepción de usuario desconocida.', this.statusCode});

  /// @returns [TreatmentException] from [DioError]
  factory TreatmentException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return TreatmentException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.sendTimeout:
        return TreatmentException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.receiveTimeout:
        return TreatmentException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.response:
        return TreatmentException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.cancel:
        return TreatmentException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.other:
        return TreatmentException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);
      default:
        return TreatmentException();
    }
  }

  /// @returns [TreatmentException] from status code with corresponding message
  /// and status code.

  factory TreatmentException.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return TreatmentException(
            message: 'El medicamento no existe.', statusCode: statusCode);
      case 401:
        return TreatmentException(
            message: 'No está autenticado.', statusCode: statusCode);
      case 403:
        return TreatmentException(
            message: 'No tiene permisos para realizar la acción.',
            statusCode: statusCode);
      case 404:
        return TreatmentException(
            message: 'El medicamento no existe.', statusCode: statusCode);
      case 409:
        return TreatmentException(
            message: 'El medicamento ya existe.', statusCode: statusCode);
      case 500:
        return TreatmentException(
            message: 'Error del servidor.', statusCode: statusCode);
      default:
        return TreatmentException();
    }
  }
}

class Nothing {}
