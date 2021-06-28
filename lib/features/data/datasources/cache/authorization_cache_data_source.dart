import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthorizationCacheDataSource {
  bool isLoggedIn();

  String getStoredToken();

  String getCurrentLoggedInUser();

  void saveAuthorizationToken(String token);

  void saveCurrentLoggedInUser(String login);

  String getCurrentUserId();

  void setCurrentUserId(String uid);

  Future<bool> clearStoredToken();
}

@Injectable(as: AuthorizationCacheDataSource)
class AuthorizationCacheDataSourceImpl implements AuthorizationCacheDataSource {
  static const authorizationToken = "authorizationToken";
  static const prefsCurrentLoggedUser = 'currentLoggedUser';
  static const prefsCurrentUserId = 'currentUserId';

  SharedPreferences sharedPreferences;

  AuthorizationCacheDataSourceImpl({this.sharedPreferences});

  @override
  bool isLoggedIn() {
    return (sharedPreferences.getString(authorizationToken) != null) ?? false;
  }

  @override
  String getStoredToken() {
    return sharedPreferences.getString(authorizationToken);
  }

  @override
  void saveAuthorizationToken(String token) {
    sharedPreferences.setString(authorizationToken, token);
  }

  @override
  String getCurrentUserId() {
    return sharedPreferences.getString(prefsCurrentUserId) ?? "";
  }

  @override
  void setCurrentUserId(String uid) {
    sharedPreferences.setString(prefsCurrentUserId, uid);
  }

  @override
  String getCurrentLoggedInUser() {
    return sharedPreferences.getString(prefsCurrentLoggedUser);
  }

  @override
  void saveCurrentLoggedInUser(String login) {
    sharedPreferences.setString(prefsCurrentLoggedUser, login);
  }

  @override
  Future<bool> clearStoredToken() async {
    return Future.value(await sharedPreferences.remove(authorizationToken) &&
        await sharedPreferences.remove(prefsCurrentLoggedUser) &&
        await sharedPreferences.remove(prefsCurrentUserId));
  }
}
