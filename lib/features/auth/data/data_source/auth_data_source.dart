import 'package:dio/dio.dart';

import '../../../../../core/networking/api_handler.dart';
import '../../../../../core/networking/end_points.dart';
import '../models/requests/login_request_model.dart';

abstract class AuthDataSource {
  Future<String> login(LoginRequestModel request);
}

class AuthDataSourceImpl extends AuthDataSource with ApiHandler {
  final Dio dio;
  AuthDataSourceImpl({required this.dio});
  @override
  Future<String> login(LoginRequestModel request) async {
    return await handleDataSourceRequest(
      onTry: () => dio.post(EndPoints.login, data: request.toJson()),
      onSuccess: (response) => response.data['token'],
    );
  }
}
