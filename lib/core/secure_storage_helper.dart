import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grad_project/core/keys.dart';

class SecureStorageHelper {
  final FlutterSecureStorage secureStorage;

  SecureStorageHelper({required this.secureStorage});
  Future<void> write({required String key, required String value}) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> get({required String key}) async {
    return await secureStorage.read(key: key);
  }
  void delete({required String key}) async {
    return await secureStorage.delete(key: key);
  }

  Future<void> writeToken({required String value}) async {
    await secureStorage.write(key: Keys.userToken, value: value);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: Keys.userToken);
  }

  Future<void> deleteToken() async {
    return await secureStorage.delete(key: Keys.userToken);
  }
}
