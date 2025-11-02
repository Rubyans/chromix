import 'package:get_storage/get_storage.dart';

/// App storage
class Storage {
  /// Local storage
  final GetStorage _storage = GetStorage();

  /// Constructor model
  Storage();

  /// Save data
  Future<void> saveData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  /// Get data
  dynamic getData(String key) {
    return _storage.read(key) ?? false;
  }

  /// Clear all
  Future<dynamic> removeAllStorage() async {
    return _storage.erase();
  }

  /// Remove key
  Future<dynamic> removeData(String key) async {
    return _storage.remove(key);
  }
}
