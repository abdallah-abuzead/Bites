import 'package:dio/dio.dart';

import '../../di/app_injections.dart';
import '../../utils/cache_storage/cache_storage.dart';
import '../../utils/cache_storage/secure_cache_storage_keys.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getIt<CacheStorage>().getData(key: SecureCacheStorageKeys.token);
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }
}
