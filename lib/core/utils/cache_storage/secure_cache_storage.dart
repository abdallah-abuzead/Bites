import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

import 'cache_storage.dart';

class SecureCacheStorage implements CacheStorage {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<bool> setData<T>({required String key, required T value}) async {
    try {
      await _secureStorage.write(key: key, value: jsonEncode(value));
      return true;
    } catch (error) {
      Logger().e(error);
      return false;
    }
  }

  @override
  Future<T?> getData<T>({required String key}) async {
    try {
      final rawValue = await _secureStorage.read(key: key);

      if (rawValue == null) return null;

      return jsonDecode(rawValue) as T;
    } catch (error) {
      Logger().e(error);
      return null;
    }
  }

  @override
  Future<bool> hasData({required String key}) {
    return _secureStorage.containsKey(key: key);
  }

  @override
  Future<bool> removeData({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> removeAllData() async {
    try {
      await _secureStorage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}
