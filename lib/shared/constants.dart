library constants;

class GeneralConstants {
  static const String appName = "Experience";
  static const String appSvgLogoWithBackground = 'assets/images/logo_experience_negroazul_vector.svg';
  static const String appSvgLogoWithoutBackground = 'assets/images/logo_experience_azulblanco_sinfondo.svg';

  static const String googleUserPrefix = "gsignin_";
  static const String facebookUserPrefix = "fsignin_";
}

class DBConstants {
  static const String dbName = "plataforma.db";
  // Database
  static const String databaseUsers = '/usuarios/';
}

class FailureMessages {
  static const String serverFailureMessage = 'Server Failure';
  static const String clientFailureMessage = 'Client Failure';
  static const String cacheFailureMessage = 'Cache Failure';
  static const String validationFailureMessage = 'validation Failure';
  static const String unauthorizedFailureMessage = 'Unauthorized access';
  static const String forbiddenFailureMessage = 'Forbidden';
  static const String connectionFailureMessage = 'No connection';
  static const String timeoutFailureMessage = 'Timeout';
  static const String networkFailureMessage = 'Network Failure';
  static const String badRequestFailureMessage = 'Bad Request';
  static const String notFoundFailureMessage = 'No se pudo acceder al recurso solicitado.';
  static const String invalidInputFailureMessage = 'Invalid Input - The number must be a positive integer or zero.';

  static const String errorEmail = 'Ingrese un e-mail válido';
  static const String errorEmptyPassword = 'Ingrese una contraseña valida';
  static const String errorMinPassword = 'La contraseña debe poseer un mínimo de 6 dígitos';
  static const String errorValidation = 'Fallo la autenticación, verifique los datos';
}

class ApiConstants {
  static const String apiBaseUrlVarEnvKey = "API_BASE_URL";
  static const String apiAuthenticateUrlVarEnvKey = "API_AUTHENTICATE_URL";
  static const String googleClientId = "386135283297-qs9eoleufkvk0kec0o3nnedcsvgc7t56.apps.googleusercontent.com";
  static const String facebookApiBaseUrl = "https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=";
  static const String langKeyEs = "es";
  static const String authoritiesRoleUser = "ROLE_USER";
  static const String authoritiesRoleAdmin = "ROLE_ADMIN";
  static const int cuentaUsuarioDefecto = 2;
}
