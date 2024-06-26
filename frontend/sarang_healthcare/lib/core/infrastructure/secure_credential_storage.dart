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
  Future<String> getUser() async {
    final email = await _secureStorage.read(key: "KEY_USERNAME") ?? "";
    return email;
  }

  static const userIdKey = "user_Id";
  String? _userId;

  @override
  Future<String?> getUserId() async {
    if (_userId != null) {
      return _userId;
    }
    final token = await _secureStorage.read(key: userIdKey);
    return token;
  }

  @override
  Future<void> setUserId(String userId) {
    _userId = userId;
    return _secureStorage.write(key: userIdKey, value: userId);
  }

  static const groupsKey = "groups";
  String? _groups;

  @override
  Future<String?> getGroups() async {
    if (_groups != null) {
      return _groups;
    }
    final token = await _secureStorage.read(key: groupsKey);
    return token;
  }

  @override
  Future<void> setGroups(String groups) {
    _groups = groups;
    return _secureStorage.write(key: groupsKey, value: groups);
  }

  @override
  Future<void> clear() async {
    _apiToken = null;
    _userId = null;
    _groups = null;
    await _secureStorage.delete(key: apiTokenKey);
    await _secureStorage.delete(key: userIdKey);
    await _secureStorage.delete(key: groupsKey);
  }

  @override
  Future<void> saveUser(String emailValue, String? passwordValue) async {
    await _secureStorage.write(key: "KEY_USERNAME", value: emailValue);
  }
}
