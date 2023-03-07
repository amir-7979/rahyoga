import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService{

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
          //accountName: _getAccountName()
          ));

  Future<void> writeData(String key, dynamic value) async {
    await _storage.write(
        key: key,
        value: value);
  }

  Future<String?> readData(String key) async {
    return await _storage.read(
        key: key,);
  }

  Future<void> deleteData(String key) async {
    await _storage.delete(
        key: key,);
  }

  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(
        key: key,);
  }

  Future<Map<String, String>> readAllData() async {
    return await _storage.readAll();
  }

  Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }
}
