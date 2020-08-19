import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageSingleton {
  static FlutterSecureStorage _flutterSecureStorage;

  FlutterSecureStorageSingleton._internal() {
    _flutterSecureStorage = FlutterSecureStorage();
  }

  static FlutterSecureStorage getSecureStorage() {
    if (_flutterSecureStorage == null) {
      return _flutterSecureStorage;
    }
    return _flutterSecureStorage;
  }
}
