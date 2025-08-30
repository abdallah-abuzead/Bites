import 'package:bites/features/contacts/data/data_source/contacts_data_source.dart';
import 'package:bites/features/contacts/domain/repository/contacts_repository.dart';
import 'package:bites/features/contacts/domain/use_cases/get_user_contacts_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../features/auth/data/data_source/auth_data_source.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/contacts/data/repository/contacts_repository_impl.dart';
import '../networking/api_client.dart';
import '../networking/network_checker.dart';
import '../utils/cache_storage/cache_storage.dart';
import '../utils/cache_storage/secure_cache_storage.dart';

final getIt = GetIt.instance;

abstract class AppInjections {
  static Future<void> init() async {
    /// Api Client
    getIt.registerLazySingleton<Dio>(() => ApiClient.dio);

    /// UseCases
    getIt.registerLazySingleton(() => LoginUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUserContactsUseCase(getIt()));

    /// Repositories
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: getIt()));
    getIt.registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(dataSource: getIt()),
    );

    /// DataSources
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(dio: getIt()));
    getIt.registerLazySingleton<ContactsDataSource>(() => ContactsDataSourceImpl(dio: getIt()));

    /// core
    getIt.registerLazySingleton<NetworkChecker>(
      () => NetworkCheckerPlusImpl(connectionChecker: getIt()),
    );
    getIt.registerLazySingleton<CacheStorage>(() => SecureCacheStorage());

    /// External
    getIt.registerLazySingleton(() => InternetConnection());
  }
}
