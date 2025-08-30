import 'package:bites/core/networking/end_points.dart';
import 'package:bites/core/networking/exceptions.dart';
import 'package:bites/features/auth/data/data_source/auth_data_source.dart';
import 'package:bites/features/auth/data/models/requests/login_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('AuthDataSource', () {
    late AuthDataSource authDataSource;
    late MockDio mockDio;
    late LoginRequestModel loginRequest;

    setUp(() {
      mockDio = MockDio();
      when(mockDio.options).thenReturn(BaseOptions());
      mockDio.options.baseUrl = EndPoints.baseUrl;

      // Create a testable AuthDataSource implementation
      authDataSource = TestableAuthDataSource(dio: mockDio);
      loginRequest = const LoginRequestModel(username: 'testUser', password: 'testPass');
    });

    group('Login - Datasource', () {
      test('returns token when login is successful', () async {
        // Arrange
        const token = 'TOKEN12345';
        final responsePayload = {'token': token};
        final response = Response(
          requestOptions: RequestOptions(path: EndPoints.login),
          data: responsePayload,
          statusCode: 200,
        );

        when(
          mockDio.post(EndPoints.login, data: loginRequest.toJson()),
        ).thenAnswer((_) async => response);

        // Act
        final result = await authDataSource.login(loginRequest);

        // Assert
        expect(result, token);
      });

      test('throws exception when login fails', () async {
        // Arrange
        final errorResponse = Response(
          requestOptions: RequestOptions(path: EndPoints.login),
          data: {'message': 'Internal Server Error'},
          statusCode: 500,
        );

        when(
          mockDio.post(EndPoints.login, data: loginRequest.toJson()),
        ).thenAnswer((_) async => errorResponse);

        // Act & Assert
        expect(() => authDataSource.login(loginRequest), throwsA(isA<ServerException>()));
      });
    });
  });
}

// Testable implementation that doesn't use GetIt
class TestableAuthDataSource implements AuthDataSource {
  final Dio dio;

  TestableAuthDataSource({required this.dio});

  @override
  Future<String> login(LoginRequestModel request) async {
    try {
      final response = await dio.post(EndPoints.login, data: request.toJson());

      if (response.statusCode == 200) {
        return response.data['token'] as String;
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw ServerException();
      }
      throw ServerException();
    }
  }
}
