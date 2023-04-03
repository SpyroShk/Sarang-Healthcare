abstract class CredentialStorage {
  Future<String?> getApiToken();
  Future<void> setApiToken(String apiToken);
  Future<void> clear();
  Future<void> getUser();
  Future<void> saveUser(String emailValue, String passwordValue);
  Future<String?> getUserId();
  Future<void> setUserId(String userId);
  Future<String?> getGroups();
  Future<void> setGroups(String groups);
}
