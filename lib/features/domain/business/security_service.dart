import 'package:injectable/injectable.dart';
import 'package:plataforma_app/features/domain/repositories/authorization_repository.dart';

@injectable
class SecurityService {
  final AuthorizationRepository securityRepository;

  SecurityService(this.securityRepository);

  bool isLoggedIn() {
    return securityRepository.isLoggedIn();
  }

  Future<String> getCurrentLoggedInUser() {
    return securityRepository.getCurrentLoggedInUser();
  }

  String getCurrentUserId() {
    return securityRepository.getCurrentUserId();
  }

  void setCurrentUserId(String uid) {
    securityRepository.setCurrentUserId(uid);
  }

  Future<String> getAuthorizationTokenApp() {
    return securityRepository.getAuthorizationTokenApp();
  }

  Future<String> getAuthorizationTokenOf(String username, String password) {
    return securityRepository.getAuthorizationTokenOf(username, password);
  }

  Future<void> clearAuthorizationToken() {
    return securityRepository.clearAuthorizationToken();
  }

  Future<void> clearUserData() {
    return securityRepository.clearUserData();
  }
}
