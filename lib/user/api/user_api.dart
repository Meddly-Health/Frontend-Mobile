import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/models.dart';

abstract class UserApi {
  /// Get user by id
  /// @param id
  /// @returns [User]
  /// @throws [UserException]
  Future<Either<UserException, User>> getUser(String id);

  /// Update user
  /// @param [User]
  /// @returns [User]
  /// @throws [UserException]

  Future<Either<UserException, User>> updateUser(User user);

  /// Delete user
  /// @param id
  /// @returns [User]
  /// @throws [UserException]

  Future<Either<UserException, User>> deleteUser(String id);
}

/// [UserException] is thrown when user api fails
/// @see [UserApi]
/// @see [User]

class UserException implements Exception {
  String message;
  int? statusCode;

  UserException(
      {this.message = 'Excepción de usuario desconocida.', this.statusCode});

  /// @returns [UserException] from [DioError]
  factory UserException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return UserException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.sendTimeout:
        return UserException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.receiveTimeout:
        return UserException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.response:
        return UserException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.cancel:
        return UserException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);

      case DioErrorType.other:
        return UserException(
            message: dioError.message,
            statusCode: dioError.response?.statusCode);
      default:
        return UserException();
    }
  }

  /// @returns [UserException] from status code with corresponding message
  /// and status code.

  factory UserException.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return UserException(
            message: 'El usuario no existe.', statusCode: statusCode);
      case 401:
        return UserException(
            message: 'No está autenticado.', statusCode: statusCode);
      case 403:
        return UserException(
            message: 'No tiene permisos para realizar la acción.',
            statusCode: statusCode);
      case 404:
        return UserException(
            message: 'El usuario no existe.', statusCode: statusCode);
      case 409:
        return UserException(
            message: 'El usuario ya existe.', statusCode: statusCode);
      case 500:
        return UserException(
            message: 'Error del servidor.', statusCode: statusCode);
      default:
        return UserException();
    }
  }
}
