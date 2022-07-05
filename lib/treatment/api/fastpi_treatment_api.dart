import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:authentication_repository/authentication_repository.dart'
    as auth;
import 'package:treatment_repository/treatment_repository.dart';

import '../../helpers/constants.dart';

class FastApiTreatmentApi extends TreatmentApi {
  final Dio _dio;
  final auth.AuthenticationRepository _authenticationRepository;
  static const _path = '/treatment/';

  FastApiTreatmentApi({required authenticationRepository, required Dio dio})
      : _authenticationRepository = authenticationRepository,
        _dio = dio
          ..options.baseUrl = baseUrl
          ..options.connectTimeout = connectTimeout
          ..options.receiveTimeout = receiveTimeout
          ..options.contentType = 'application/json';

  @override
  Future<Either<TreatmentException, Treatment>> addTreatment(
      Treatment treatment) async {
    String token = await _authenticationRepository.getAuthToken();

    try {
      var response = await _dio.post(
        _path,
        data: treatment.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        return Right(treatment);
      } else {
        return Left(TreatmentException(
            message: 'Error ${response.statusCode} ${response.statusMessage}'));
      }
    } on DioError catch (e) {
      return Left(TreatmentException.fromDioError(e));
    } catch (e) {
      return Left(TreatmentException(message: e.toString()));
    }
  }

  @override
  Future<Either<TreatmentException, Nothing>> deleteTreatment(String id) async {
    // String token = await _authenticationRepository.getAuthToken();

    throw UnimplementedError();
  }

  @override
  Future<Either<TreatmentException, List<Treatment>>> getTreatments() async {
    String token = await _authenticationRepository.getAuthToken();

    try {
      var response = await _dio.get(
        _path,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        if (response.data == null) {
          return const Right([]);
        }
        return Right(
            (response.data as List).map((e) => Treatment.fromJson(e)).toList());
      } else {
        return Left(TreatmentException(
            message: 'Error ${response.statusCode} ${response.statusMessage}'));
      }
    } on DioError catch (e) {
      return Left(TreatmentException.fromDioError(e));
    } catch (e) {
      return Left(TreatmentException(message: e.toString()));
    }
  }

  @override
  Future<Either<TreatmentException, Treatment>> updateTreatment(
      Treatment treatment) {
    // TODO: implement updateTreatment
    throw UnimplementedError();
  }

  @override
  Future<Either<TreatmentException, Nothing>> addConsumption(
      String id, DateTime dateTime) async {
    String token = await _authenticationRepository.getAuthToken();

    try {
      var response = await _dio.post(
        _path + id + '/consumption',
        // TODO: Será así??
        data: {'consumption_date': dateTime.toIso8601String()},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 201) {
        return Right(Nothing());
      } else {
        return Left(TreatmentException(
            message: 'Error ${response.statusCode} ${response.statusMessage}'));
      }
    } on DioError catch (e) {
      return Left(TreatmentException.fromDioError(e));
    } catch (e) {
      return Left(TreatmentException(message: e.toString()));
    }
  }

  @override
  Future<Either<TreatmentException, Nothing>> deleteConsumption(String id) {
    // TODO: implement deleteConsumption
    throw UnimplementedError();
  }
}
