import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureLocalStorage {
  final FlutterSecureStorage _storage;
  const SecureLocalStorage(this._storage);

  Future<String> load({required String key, String? boxName}) async {
    final result = await _storage.read(key: key);
    return result ?? "";
  }

  Future<void> save({
    required String key,
    required value,
    String? boxName,
  }) async {
    final result = await _storage.write(key: key, value: value);
    return result;
  }

  Future<void> delete({required String key, String? boxName}) async {
    await _storage.delete(key: key);

    return;
  }



  /// Delete all stored keys (Logout or clear user data)
  // Future<void> clearAll() async {
  //   await _storage.deleteAll();
  // }
}
