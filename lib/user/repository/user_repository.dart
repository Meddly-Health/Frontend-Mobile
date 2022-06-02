import 'package:dartz/dartz.dart';
import 'package:meddly/helpers/helpers.dart';

import '../api/api.dart';
import '../models/models.dart';

class UserRepository {
  final UserApi _userApi;

  UserRepository({required UserApi userApi}) : _userApi = userApi;

  /// Get user by id
  ///
  /// returns either a [User] or a [UserException]
  Future<Either<UserException, User>> getUser(String id) async =>
      await _userApi.getUser(id);

  /// Update user
  ///
  /// returns either a [User] or a [UserException]
  Future<Either<UserException, User>> updateUser(User user) async =>
      await _userApi.updateUser(user);

  /// Delete user
  ///
  /// returns either a [User] or a [UserException]
  Future<Either<UserException, User>> deleteUser(String id) async =>
      await _userApi.deleteUser(id);

  /// Accepts a supervisors invitation
  ///
  /// returns either a [User] or a [UserException]
  Future<Either<UserException, Nothing>> acceptInvitation(String code) async =>
      await _userApi.acceptInvitation(code);
}
