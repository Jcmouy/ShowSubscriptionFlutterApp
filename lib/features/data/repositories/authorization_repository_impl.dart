import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/data/datasources/cache/authorization_cache_data_source.dart';
import 'package:plataforma_app/features/data/datasources/remote/authorization_remote_data_source.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';

@Injectable(as: AuthorizationRepository)
class AuthorizationRepositoryImpl implements AuthorizationRepository {
  AuthorizationCacheDataSource authorizationCacheDataSource;
  AuthorizationRemoteDataSource authorizationRemoteDataSource;

  AuthorizationRepositoryImpl(this.authorizationCacheDataSource, this.authorizationRemoteDataSource);

  @override
  bool isLoggedIn() {
    return authorizationCacheDataSource.isLoggedIn();
  }

  @override
  Future<String> getCurrentLoggedInUser() async {
    return authorizationCacheDataSource.getCurrentLoggedInUser();
  }

  @override
  String getCurrentUserId() {
    return authorizationCacheDataSource.getCurrentUserId();
  }

  @override
  void setCurrentUserId(String uid) {
    authorizationCacheDataSource.setCurrentUserId(uid);
  }

  @override
  Future<String> getAuthorizationTokenApp() async {
    final String token = authorizationCacheDataSource.getStoredToken();
    return token;
  }

  @override
  Future<String> getAuthorizationTokenOf(String username, String password) async {
    String token = authorizationCacheDataSource.getStoredToken();
    if (token == null) {
      token = await authorizationRemoteDataSource.authenticateWithUserCredentials(password, username);
      authorizationCacheDataSource.saveAuthorizationToken(token);
      authorizationCacheDataSource.saveCurrentLoggedInUser(username);
    }
    return token;
  }

  @override
  Future<void> clearAuthorizationToken() async {
    final String token = authorizationCacheDataSource.getStoredToken();
    if (token != null) {
      await authorizationCacheDataSource.clearStoredToken();
    }
  }

  @override
  Future<void> clearUserData() async {
    final String token = authorizationCacheDataSource.getStoredToken();
    if (token != null) {
      await authorizationCacheDataSource.clearStoredToken();
    }
  }
}
