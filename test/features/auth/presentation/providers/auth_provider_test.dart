import 'package:bites/core/networking/failures.dart';
import 'package:bites/features/auth/domain/entities/requests/login_request.dart';
import 'package:bites/features/auth/domain/use_cases/login_use_case.dart';
import 'package:bites/features/auth/presentation/providers/auth_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_provider_test.mocks.dart';

@GenerateMocks([LoginUseCase])
void main() {
  group('AuthNotifier', () {
    late AuthNotifier authNotifier;
    late MockLoginUseCase mockLoginUseCase;
    late LoginRequest loginRequest;

    setUp(() {
      mockLoginUseCase = MockLoginUseCase();
      authNotifier = AuthNotifier(loginUseCase: mockLoginUseCase);
      loginRequest = const LoginRequest(username: 'testUser', password: 'testPass');
    });

    group('login', () {
      test('should emit success state when login is successful', () async {
        // Arrange
        const token = 'TOKEN12345';
        when(mockLoginUseCase(loginRequest)).thenAnswer((_) async => const Right(token));

        // Act
        await authNotifier.login(loginRequest);

        // Assert
        expect(authNotifier.state, equals(const AuthState.successLogin(token)));
      });

      test('should emit error state when login fails', () async {
        // Arrange
        final failure = ServerFailure();
        when(mockLoginUseCase(loginRequest)).thenAnswer((_) async => Left(failure));

        // Act
        await authNotifier.login(loginRequest);

        // Assert
        expect(authNotifier.state, equals(AuthState.errorLogin(failure: failure)));
      });
    });
  });
}
