import 'package:dartz/dartz.dart';

import '../api/api.dart';
import '../models/models.dart';

class UserRepository {
  final UserApi _userApi;

  UserRepository({required UserApi userApi}) : _userApi = userApi;

  /// Get user by id
  /// @param id
  /// @returns [User]
  /// @throws [UserException]

  Future<Either<UserException, User>> getUser(String id) async =>
      await _userApi.getUser(id);

  /// Update user
  /// @param [User]
  /// @returns [User]
  /// @throws [UserException]

  Future<Either<UserException, User>> updateUser(User user) async =>
      await _userApi.updateUser(user);

  /// Delete user
  /// @param id
  /// @returns [User]
  /// @throws [UserException]

  Future<Either<UserException, User>> deleteUser(String id) async =>
      await _userApi.deleteUser(id);
}
