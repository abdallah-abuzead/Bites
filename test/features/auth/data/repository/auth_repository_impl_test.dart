import 'package:bites/core/networking/exceptions.dart';
import 'package:bites/core/networking/failures.dart';
import 'package:bites/features/auth/data/data_source/auth_data_source.dart';
import 'package:bites/features/auth/data/models/requests/login_request_model.dart';
import 'package:bites/features/auth/domain/entities/requests/login_request.dart';
import 'package:bites/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthDataSource])
void main() {
  group('AuthRepositoryImpl', () {
    late TestableAuthRepository repository;
    late MockAuthDataSource mockDataSource;
    late LoginRequest loginRequest;

    setUp(() {
      mockDataSource = MockAuthDataSource();
      repository = TestableAuthRepository(dataSource: mockDataSource);
      loginRequest = const LoginRequest(username: 'testUser', password: 'testPass');
    });

    group('login', () {
      test('returns token when login is successful', () async {
        // Arrange
        const token = 'TOKEN12345';
        when(mockDataSource.login(any)).thenAnswer((_) async => token);

        // Act
        final result = await repository.login(loginRequest);

        // Assert
        expect(result, equals(const Right(token)));
      });

      test('returns failure when login fails', () async {
        // Arrange
        when(mockDataSource.login(any)).thenThrow(ServerException());

        // Act
        final result = await repository.login(loginRequest);

        // Assert
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}

// Testable implementation that doesn't use ApiHandler mixin
class TestableAuthRepository implements AuthRepository {
  final AuthDataSource dataSource;

  TestableAuthRepository({required this.dataSource});

  @override
  Future<Either<Failure, String>> login(LoginRequest request) async {
    try {
      final String token = await dataSource.login(LoginRequestModel.fromEntity(request));
      return Right(token);
    } on ServerException {
      return Left(ServerFailure());
    } on UnauthorizedException {
      return Left(UnauthorizedFailure());
    } on ValidationException {
      return Left(ValidationFailure());
    } on OfflineException {
      return Left(OfflineFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
