import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../di/app_injections.dart';
import '../utils/helpers.dart';
import 'exceptions.dart';
import 'failures.dart';
import 'network_checker.dart';

mixin ApiHandler {
  NetworkChecker networkChecker = getIt<NetworkChecker>();

  Future<Either<Failure, T>> handleRepoFunction<T>({required Function() onTry}) async {
    if (await networkChecker.isConnected) {
      try {
        return Right(await onTry());
      } on ServerException {
        return Left(ServerFailure());
      } on UnauthorizedException {
        return Left(UnauthorizedFailure());
      } on ValidationException catch (e) {
        return Left(ValidationFailure(message: e.message));
      } on DataTypeChangeException {
        return Left(DataTypeChangeFailure());
      } on ConnectionTimeoutException {
        return Left(ConnectionTimeoutFailure());
      } on ConnectionErrorException {
        return Left(ConnectionErrorFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<T> handleDataSourceRequest<T>({
    required Function() onTry,
    required T Function(Response response) onSuccess,
    bool isResults = false,
  }) async {
    try {
      final Response response = await onTry();
      if (response.statusCode == 201 || response.statusCode == 200) {
        return _handleDataTypeException(response, onSuccess);
      } else if (response.statusCode == 400) {
        throw ValidationException(message: response.data['message']);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  Future<T> _handleDataTypeException<T>(
    Response response,
    T Function(Response response) onSuccess,
  ) async {
    try {
      return onSuccess(response);
    } catch (e, stackTrace) {
      printf(stackTrace);
      throw DataTypeChangeException();
    }
  }

  Future<Never> _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw ConnectionTimeoutException();
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        throw ConnectionErrorException();
      default:
        throw ServerException();
    }
  }
}
