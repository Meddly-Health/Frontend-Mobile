import 'package:authentication_repository/authentication_repository.dart'
    as auth;
import 'package:authentication_repository/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:meddly/helpers/constants.dart';

import 'package:dartz/dartz.dart';
import 'package:meddly/helpers/helpers.dart';
import 'package:meddly/user/models/user.dart';

import 'api.dart';

/// MongoDB userApi.
/// @see [User]
/// @see [UserException]

class FastApiUserApi extends UserApi {
  final Dio _dio;
  final auth.AuthenticationRepository _authenticationRepository;

  FastApiUserApi({required authenticationRepository, required Dio dio})
      : _authenticationRepository = authenticationRepository,
        _dio = dio
          ..options.baseUrl = baseUrl
          ..options.contentType = 'application/json';

  @override
  Future<Either<UserException, User>> getUser(String id) async {
    try {
      String token = await _authenticationRepository.getAuthToken();
      Response response = await _dio.get('/user/',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      if (response.statusCode == 200) {
        return Right(User.fromJson(response.data));
      } else {
        return Left(UserException.fromStatusCode(response.statusCode!));
      }
    } on DioError catch (e) {
      return Left(UserException.fromDioError(e));
    } catch (e) {
      return Left(UserException());
    }
  }

  @override
  Future<Either<UserException, User>> deleteUser(String id) async {
    try {
      String token = await _authenticationRepository.getAuthToken();
      Response response = await _dio.delete('/user/',
          data: {'id': id},
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      await _authenticationRepository.deleteUser();

      if (response.statusCode == 200) {
        return Right(User.fromJson(response.data));
      } else {
        return Left(UserException.fromStatusCode(response.statusCode!));
      }
    } on DeleteUserFailure catch (e) {
      return Left(UserException(message: e.message));
    } on DioError catch (e) {
      return Left(UserException.fromDioError(e));
    } catch (e) {
      return Left(UserException());
    }
  }

  @override
  Future<Either<UserException, User>> updateUser(User user) async {
    try {
      String token = await _authenticationRepository.getAuthToken();

      Response response = await _dio.post('/user/',
          data: user.toJson(),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      if (response.statusCode == 201) {
        return Right(User.fromJson(response.data));
      } else {
        return Left(UserException.fromStatusCode(response.statusCode!));
      }
    } on DioError catch (e) {
      return Left(UserException.fromDioError(e));
    } catch (e) {
      return Left(UserException());
    }
  }

  @override
  Future<Either<UserException, Nothing>> acceptInvitation(String code) async {
    try {
      String token = await _authenticationRepository.getAuthToken();

      Response response = await _dio.post('/supervisors/invitation',
          queryParameters: {'code': code},
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ));

      if (response.statusCode == 200) {
        return const Right(Nothing());
      } else {
        return Left(UserException.fromStatusCode(response.statusCode!));
      }
    } on DioError catch (e) {
      return Left(UserException.fromDioError(e));
    } catch (e) {
      return Left(UserException());
    }
  }
}
