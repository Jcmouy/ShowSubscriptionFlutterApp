abstract class AuthorizationRepository {
  bool isLoggedIn();

  Future<String> getCurrentLoggedInUser();

  String getCurrentUserId();

  void setCurrentUserId(String uid);

  Future<String> getAuthorizationTokenApp();

  Future<String> getAuthorizationTokenOf(String username, String password);

  Future<void> clearAuthorizationToken();

  Future<void> clearUserData();
}
