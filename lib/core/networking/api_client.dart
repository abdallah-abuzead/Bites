import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:requests_inspector/requests_inspector.dart';

import 'end_points.dart';
import 'interceptors/token_interceptor.dart';

abstract class ApiClient {
  static const int requestDuration = 30;
  static final Dio dio = Dio()
    ..options.baseUrl = EndPoints.baseUrl
    ..options.receiveTimeout = const Duration(seconds: requestDuration)
    ..options.connectTimeout = const Duration(seconds: requestDuration)
    ..options.sendTimeout = const Duration(seconds: requestDuration)
    ..options.responseType = ResponseType.json
    ..options.contentType = 'application/json'
    ..options.receiveDataWhenStatusError = true
    ..options.validateStatus = (code) {
      return true;
    }
    ..interceptors.addAll([
      TokenInterceptor(),
      PrettyDioLogger(requestHeader: true, requestBody: true),
      RequestsInspectorInterceptor(),
    ]);
}
