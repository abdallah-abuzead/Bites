import 'package:bites/core/networking/failures.dart';
import 'package:bites/features/auth/domain/entities/requests/login_request.dart';
import 'package:bites/features/auth/domain/repository/auth_repository.dart';
import 'package:bites/features/auth/domain/use_cases/login_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase loginUseCase;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  group('Test LoginUseCase', () {
    test('Return Right(String) when success login', () async {
      // Arrange
      final String token = 'TOKEN';
      final LoginRequest request = const LoginRequest(username: 'username', password: 'password');
      when(mockAuthRepository.login(any)).thenAnswer((_) async => Future.value(Right(token)));

      // Act
      final result = await loginUseCase(request);

      // Assert
      expect(result, equals(Right(token)));
    });

    test('Return Left(Failure) when failed login', () async {
      // Arrange
      final failure = ServerFailure();
      final LoginRequest request = const LoginRequest(username: 'username', password: 'password');
      when(
        mockAuthRepository.login(request),
      ).thenAnswer((_) async => Future.value(Left(ServerFailure())));

      // Act
      final result = await loginUseCase(request);

      // Assert
      expect(result, equals(Left(failure)));
    });
  });
}
