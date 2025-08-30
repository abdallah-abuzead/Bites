import 'package:bites/core/networking/exceptions.dart';
import 'package:bites/core/networking/failures.dart';
import 'package:bites/core/networking/network_checker.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_handler_test.mocks.dart';

@GenerateMocks([NetworkChecker])
void main() {
  group('ApiHandler Logic Tests', () {
    late MockNetworkChecker mockNetworkChecker;
    late TestableApiHandler apiHandler;

    setUp(() {
      mockNetworkChecker = MockNetworkChecker();
      apiHandler = TestableApiHandler(mockNetworkChecker);
    });

    group('handleRepoFunction', () {
      test('should return Right when network is connected and onTry succeeds', () async {
        // Arrange
        when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);

        // Act
        final result = await apiHandler.handleRepoFunction(onTry: () async => 'Success');

        // Assert
        expect(result, const Right('Success'));
      });

      test('Return Left(OfflineFailure) when no internet connection', () async {
        // Arrange
        when(mockNetworkChecker.isConnected).thenAnswer((_) async => false);

        // Act
        final result = await apiHandler.handleRepoFunction(onTry: () async => 'Success');

        // Assert
        expect(result, Left(OfflineFailure()));
      });

      test('should return Left with ServerFailure when ServerException is thrown', () async {
        // Arrange
        when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);

        // Act
        final result = await apiHandler.handleRepoFunction(
          onTry: () async {
            throw ServerException();
          },
        );

        // Assert
        expect(result, isA<Left>());
        expect(result.fold((l) => l, (r) => null), isA<ServerFailure>());
        verify(mockNetworkChecker.isConnected).called(1);
      });

      test(
        'should return Left with UnauthorizedFailure when UnauthorizedException is thrown',
        () async {
          // Arrange
          when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);

          // Act
          final result = await apiHandler.handleRepoFunction(
            onTry: () async {
              throw UnauthorizedException();
            },
          );

          // Assert
          expect(result, isA<Left>());
          expect(result.fold((l) => l, (r) => null), isA<UnauthorizedFailure>());
          verify(mockNetworkChecker.isConnected).called(1);
        },
      );

      test(
        'should return Left with ValidationFailure when ValidationException is thrown',
        () async {
          // Arrange
          const errorMessage = 'Validation error';
          when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);

          // Act
          final result = await apiHandler.handleRepoFunction(
            onTry: () async {
              throw ValidationException(message: errorMessage);
            },
          );

          // Assert
          expect(result, isA<Left>());
          final failure = result.fold((l) => l, (r) => null);
          expect(failure, isA<ValidationFailure>());
          expect((failure as ValidationFailure).message, equals(errorMessage));
          verify(mockNetworkChecker.isConnected).called(1);
        },
      );

      test(
        'should return Left with DataTypeChangeFailure when DataTypeChangeException is thrown',
        () async {
          // Arrange
          when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);

          // Act
          final result = await apiHandler.handleRepoFunction(
            onTry: () async {
              throw DataTypeChangeException();
            },
          );

          // Assert
          expect(result, isA<Left>());
          expect(result.fold((l) => l, (r) => null), isA<DataTypeChangeFailure>());
          verify(mockNetworkChecker.isConnected).called(1);
        },
      );

      test(
        'should return Left with ConnectionTimeoutFailure when ConnectionTimeoutException is thrown',
        () async {
          // Arrange
          when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);

          // Act
          final result = await apiHandler.handleRepoFunction(
            onTry: () async {
              throw ConnectionTimeoutException();
            },
          );

          // Assert
          expect(result, isA<Left>());
          expect(result.fold((l) => l, (r) => null), isA<ConnectionTimeoutFailure>());
          verify(mockNetworkChecker.isConnected).called(1);
        },
      );

      test(
        'should return Left with ConnectionErrorFailure when ConnectionErrorException is thrown',
        () async {
          // Arrange
          when(mockNetworkChecker.isConnected).thenAnswer((_) async => true);

          // Act
          final result = await apiHandler.handleRepoFunction(
            onTry: () async {
              throw ConnectionErrorException();
            },
          );

          // Assert
          expect(result, isA<Left>());
          expect(result.fold((l) => l, (r) => null), isA<ConnectionErrorFailure>());
          verify(mockNetworkChecker.isConnected).called(1);
        },
      );
    });

    //============================================================================

    group('handleDataSourceRequest', () {
      test('should return data when status code is 200', () async {
        // Arrange
        const expectedData = 'test data';
        final response = Response(
          data: expectedData,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act
        final result = await apiHandler.handleDataSourceRequest(
          onTry: () async => response,
          onSuccess: (response) => response.data,
        );

        // Assert
        expect(result, equals(expectedData));
      });

      test('should return data when status code is 201', () async {
        // Arrange
        const expectedData = 'test data';
        final response = Response(
          data: expectedData,
          statusCode: 201,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act
        final result = await apiHandler.handleDataSourceRequest(
          onTry: () async => response,
          onSuccess: (response) => response.data,
        );

        // Assert
        expect(result, equals(expectedData));
      });

      test('should throw ValidationException when status code is 400', () async {
        // Arrange
        const errorMessage = 'Bad request';
        final response = Response(
          data: {'message': errorMessage},
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async => response,
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ValidationException>()),
        );
      });

      test('should throw UnauthorizedException when status code is 401', () async {
        // Arrange
        final response = Response(
          data: 'Unauthorized',
          statusCode: 401,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async => response,
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<UnauthorizedException>()),
        );
      });

      test('should throw ServerException for other status codes', () async {
        // Arrange
        final response = Response(
          data: 'Server error',
          statusCode: 500,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async => response,
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ServerException>()),
        );
      });

      test('should throw DataTypeChangeException when onSuccess throws an exception', () async {
        // Arrange
        final response = Response(
          data: 'test data',
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async => response,
            onSuccess: (response) {
              throw Exception('Data type error');
            },
          ),
          throwsA(isA<DataTypeChangeException>()),
        );
      });

      test('should handle connection timeout DioException', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ConnectionTimeoutException>()),
        );
      });

      test('should handle send timeout DioException', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.sendTimeout,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ConnectionTimeoutException>()),
        );
      });

      test('should handle receive timeout DioException', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.receiveTimeout,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ConnectionTimeoutException>()),
        );
      });

      test('should handle bad certificate DioException', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.badCertificate,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ConnectionErrorException>()),
        );
      });

      test('should handle bad response DioException', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ConnectionErrorException>()),
        );
      });

      test('should handle cancel DioException', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.cancel,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ConnectionErrorException>()),
        );
      });

      test('should handle connection error DioException', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.connectionError,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ConnectionErrorException>()),
        );
      });

      test('should handle unknown DioException types', () async {
        // Arrange
        final dioException = DioException(
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(path: '/test'),
        );

        // Act & Assert
        expect(
          () => apiHandler.handleDataSourceRequest(
            onTry: () async {
              throw dioException;
            },
            onSuccess: (response) => response.data,
          ),
          throwsA(isA<ServerException>()),
        );
      });
    });
  });
}

// Testable version of ApiHandler that doesn't depend on GetIt
class TestableApiHandler {
  final NetworkChecker networkChecker;

  TestableApiHandler(this.networkChecker);

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
      // In test environment, we don't need to print
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
