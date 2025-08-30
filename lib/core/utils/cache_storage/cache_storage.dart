abstract class CacheStorage {
  Future<bool> setData<T>({required String key, required T value});
  Future<T?> getData<T>({required String key});
  Future<bool> hasData({required String key});
  Future<bool> removeData({required String key});
  Future<bool> removeAllData();
}
