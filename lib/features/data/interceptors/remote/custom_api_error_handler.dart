import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:plataforma_app/core/error/exceptions.dart';

class CustomApiErrorHandler {
  static void mapDioErrorToApiException(DioError e) {
    if (e.response != null) {
      CustomApiErrorHandler.mapApiErrorToException(e.response.statusCode, e.response.statusMessage, e.response.data);
    } else {
      CustomApiErrorHandler.mapRequestErrorToException(e.message);
    }
    throw ClientException(e.error.toString());
  }

  //go through all custom errors and return the corresponding error message
  static void mapApiErrorToException(int statusCode, String statusMessage, dynamic error) {
    if (statusCode < 400) {
      return;
    }
    if (statusCode == 401 || statusCode == 403) {
      if (error == null) {
        if (statusCode == 403) {
          throw SecurityException.forbiddenMessage();
        } else {
          throw SecurityException.unauthorizedMessage();
        }
      } else {
        final String message = parseApiErrorMessage(error);
        throw SecurityException(message);
      }
    }
    if (statusCode == 404) {
      if (error == null) {
        throw NotFoundException.defaultMessage();
      } else {
        final String message = parseApiErrorMessage(error);
        throw NotFoundException(message);
      }
    }
    if (statusCode >= 400 && statusCode < 500) {
      if (error == null) {
        throw ClientException('$statusMessage ($statusCode)');
      } else {
        final String message = parseApiErrorMessage(error);
        throw ClientException(message);
      }
    }
    if (statusCode >= 500 && statusCode < 600) {
      if (error == null) {
        throw ServerException('$statusMessage ($statusCode)');
      } else {
        final String message = parseApiErrorMessage(error);
        throw ServerException(message);
      }
    }
  }

  static String parseApiErrorMessage(dynamic error) {
    final Map<String, dynamic> respuesta = jsonDecode(error as String) as Map<String, dynamic>;
    if (respuesta.containsKey('errorKey')) {
      return traducirErrores(respuesta['errorKey'] as String);
    } else if (respuesta.containsKey('message') && (respuesta['message'] as String).contains('error.validation')) {
      //TODO implementar todas las validaciones
      return parseApiValidationError(respuesta);
    } else {
      return respuesta['title'] as String;
    }
  }

  static String parseApiValidationError(Map<String, dynamic> respuesta) {
    return respuesta['message'] as String;
  }

  static void mapRequestErrorToException(String error) {
    throw ClientException(error);
  }

  static String traducirErrores(String error) {
    //TODO usar internacionalizacion
    switch (error) {
      case "userexists":
        return "¡El nombre de usuario ya está registrado! Por favor, escoja otro usuario.";
      case "fail":
        return "¡El registro ha fallado! Por favor, inténtelo de nuevo más tarde.";
      case "emailexists":
        return "¡El correo electrónico ya está en uso! Por favor, escoja otro email.";
      case "internalServerError":
        return "Error interno en el servidor.";
      case "server.not.reachable":
        return "Servidor no accesible.";
      case "url.not.found":
        return "No existe.";
      case "NotNull":
        return "¡El campo {{fieldName}} no puede estar vacío!";
      case "Size":
        return "¡El campo {{fieldName}} no cumple con los requisitos de tamaño mínimo/máximo!";
      case "idexists":
        return "Un/a nuevo/a {{entityName}} no puede tener ID";
      case "idnull":
        return "ID inválido.";
      case "file":
        return "Could not extract file.";
      case "could.not.extract":
        return "Could not extract file.";
      case "not.image":
        return 'File was expected to be an image but was found to be "{{ fileType }}".';
      default:
        return error;
    }
    //TODO implementar servicio de traduccion
  }

  static String traducirValidaciones(String validationMessage) {
    //TODO usar internacionalizacion
    switch (validationMessage) {
      case "required":
        return "Este campo es obligatorio.";
      case "minlength":
        return "Este campo requiere al menos {{min}} caracteres.";
      case "maxlength":
        return "Este campo no puede superar más de {{max}} caracteres.";
      case "min":
        return "Este campo debe ser mayor que {{min}}.";
      case "max":
        return "Este campo no puede ser mayor que {{max}}.";
      case "minbytes":
        return "Este campo debe tener como mínimo {{min}} bytes.";
      case "maxbytes":
        return "Este campo no puede tener más de {{max}} bytes.";
      case "pattern":
        return "Este campo debe seguir el patrón {{pattern}}.";
      case "number":
        return "Este campo debe ser un número.";
      case "datetimelocal":
        return "Este campo debe ser una fecha y hora.";
      default:
        return validationMessage;
    }

    //TODO implementar servicio de traduccion
  }
  /***** PROXIMOS A INTERNACIONALIZAR - VALIDACIONES
   * "validate": {
        "login": {
          "": "Su nombre de usuario es obligatorio.",
          "minlength": "Su nombre de usuario debe tener al menos 1 caracter.",
          "maxlength": "Su nombre de usuario no puede tener más de 50 caracteres.",
          "pattern": "Your username is invalid."
        }
      },

    "validation": {
      
    }
   */
}
