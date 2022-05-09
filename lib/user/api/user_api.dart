import 'package:dartz/dartz.dart';

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

class UserException implements Exception {
  final String message;

  UserException({this.message = 'Excepción de usuario desconocida.'});
}
