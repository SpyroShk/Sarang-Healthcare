import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'credential_storage.dart';

class SecureCredentialStorage implements CredentialStorage {
  final FlutterSecureStorage _secureStorage;

  SecureCredentialStorage(this._secureStorage);

  static const apiTokenKey = "api_token";
  String? _apiToken;

  @override
  Future<String?> getApiToken() async {
    if (_apiToken != null) {
      return _apiToken;
    }
    final token = await _secureStorage.read(key: apiTokenKey);
    return token;
  }

  @override
  Future<void> setApiToken(String apiToken) {
    _apiToken = apiToken;
    return _secureStorage.write(key: apiTokenKey, value: apiToken);
  }

  @override
  Future<void> clear() async {
    _apiToken = null;
    return _secureStorage.delete(key: apiTokenKey);
  }

  @override
  Future<void> saveUser(String emailValue, String? passwordValue) async {
    await _secureStorage.write(key: "KEY_USERNAME", value: emailValue);
  }

  @override
  Future<String> getUser() async {
    final email = await _secureStorage.read(key: "KEY_USERNAME") ?? "";
    return email;
  }
}
