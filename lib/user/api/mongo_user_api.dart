import 'package:authentication_repository/authentication_repository.dart'
    as auth;
import 'package:dio/dio.dart';
import 'package:meddly/helpers/constants.dart';

import 'package:dartz/dartz.dart';
import 'package:meddly/user/models/user.dart';

import 'api.dart';

/// MongoDB userApi.
/// @see [User]
/// @see [UserException]

class MongoUserApi extends UserApi {
  final Dio _dio;
  final auth.AuthenticationRepository _authenticationRepository;

  MongoUserApi({required authenticationRepository, required Dio dio})
      : _authenticationRepository = authenticationRepository,
        _dio = dio..options.baseUrl = baseUrl;

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
  Future<Either<UserException, User>> updateUser(User user) async {
    try {
      String token = await _authenticationRepository.getAuthToken();
      Response response = await _dio.post('/user/',
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
}
