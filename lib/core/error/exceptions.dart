import 'package:plataforma_app/shared/constants.dart' as constants;

abstract class CustomException implements Exception {
  final String _message;

  CustomException(this._message);

  String get message => _message;
}

class ServerException extends CustomException {
  ServerException(String message) : super(message);

  factory ServerException.defaultMessage() {
    return ServerException(constants.FailureMessages.serverFailureMessage);
  }
}

class CacheException extends CustomException {
  CacheException(String message) : super(message);

  factory CacheException.defaultMessage() {
    return CacheException(constants.FailureMessages.cacheFailureMessage);
  }
}

class ConnectionExceptions extends CustomException {
  ConnectionExceptions(String message) : super(message);

  factory ConnectionExceptions.defaultMessage() {
    return ConnectionExceptions(constants.FailureMessages.connectionFailureMessage);
  }
}

class TimeoutException extends ConnectionExceptions {
  TimeoutException() : super(constants.FailureMessages.timeoutFailureMessage);
}

class NetworkException extends ConnectionExceptions {
  NetworkException() : super(constants.FailureMessages.networkFailureMessage);
}

class BadRequestException extends ConnectionExceptions {
  BadRequestException() : super(constants.FailureMessages.badRequestFailureMessage);
}

class NotFoundException extends CustomException {
  NotFoundException(String message) : super(message);

  factory NotFoundException.defaultMessage() {
    return NotFoundException(constants.FailureMessages.notFoundFailureMessage);
  }
}

class SecurityException extends CustomException {
  SecurityException(String message) : super(message);

  factory SecurityException.unauthorizedMessage() {
    return SecurityException(constants.FailureMessages.unauthorizedFailureMessage);
  }

  factory SecurityException.forbiddenMessage() {
    return SecurityException(constants.FailureMessages.forbiddenFailureMessage);
  }
}

class ClientException extends CustomException {
  ClientException(String message) : super(message);

  factory ClientException.defaultMessage() {
    return ClientException(constants.FailureMessages.clientFailureMessage);
  }
}

class ValidationException extends CustomException {
  ValidationException(String message) : super(message);

  factory ValidationException.defaultMessage() {
    return ValidationException(constants.FailureMessages.validationFailureMessage);
  }
}

class AppExceptions implements Exception {}

class GenericException extends AppExceptions {
  GenericException() : super();
}
