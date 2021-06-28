import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plataforma_app/core/error/exceptions.dart';
import 'package:plataforma_app/features/domain/business/security_service.dart';
import 'package:plataforma_app/features/presentation/login/login_page.dart';
import 'package:plataforma_app/injection.dart';
import 'package:dio/dio.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class ErrorHandler {

  //go through all custom errors and return the corresponding error message
  static String errorMessage(dynamic error) {
    if (error == null) {
      return null;
    }
    if (error is ServerException) {
      return error.message;
    }

    if (error is ClientException) {
      return error.message;
    }

    if (error is SecurityException) {
      return error.message;
    }

    if (error is CacheException) {
      return error.message;
    }

    if (error is ValidationException) {
      return error.message;
    }

    if (error is NetworkException) {
      return error.toString();
    }

    if (error is DioError) {
      return error.toString();
    }
    // throw unexpected error.
    debugPrint(error.toString());
    return error.toString();
  }

  //Display an AlertDialog with the error message
  static void showErrorDialog(BuildContext context, dynamic error) {
    if (error == null) {
      return;
    }

    final AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          FadingAnimation(),
          Container(margin: const EdgeInsets.only(left: 7), child: Text(errorMessage(error))),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //TODO eliminar las referencias a states rebuilder y luego renombrar este metodo
  static void showErrorSnackBar(BuildContext context, dynamic error) {
    _showSnackBar(context, error, Colors.red);
  }

  //Display an snackBar with the error message
  static void showSnackBar(BuildContext context, dynamic error) {
    _showSnackBar(context, error, Colors.indigo);
  }

  //Display an snackBar with the error message
  static void _showSnackBar(BuildContext context, dynamic error, MaterialColor backgroundColor) {
    if (error == null) {
      return;
    }

    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage(error)),
        backgroundColor: backgroundColor,
      ),
    );
  }

  static void debugPrintAppError(dynamic error) {
    debugPrint(errorMessage(error));
  }

  //Display an snackBar with the error message
  void handleInvalidToken(BuildContext context) {
    showErrorSnackBar(context, 'No fue posible validar el usuario logeado');

    getIt<SecurityService>().clearUserData();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
