import 'package:bites/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/di/app_injections.dart';
import '../../../../core/networking/api_handler.dart';
import '../../../../core/networking/failures.dart';
import '../../../../core/utils/cache_storage/cache_storage.dart';
import '../../../../core/utils/cache_storage/secure_cache_storage_keys.dart';
import '../../domain/entities/requests/login_request.dart';
import '../data_source/auth_data_source.dart';
import '../models/requests/login_request_model.dart';

class AuthRepositoryImpl extends AuthRepository with ApiHandler {
  final AuthDataSource dataSource;
  AuthRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, String>> login(LoginRequest request) {
    return handleRepoFunction(
      onTry: () async {
        await getIt<CacheStorage>().removeData(key: SecureCacheStorageKeys.token);
        final String token = await dataSource.login(LoginRequestModel.fromEntity(request));
        await getIt<CacheStorage>().setData(key: SecureCacheStorageKeys.token, value: token.trim());
        return token;
      },
    );
  }
}
