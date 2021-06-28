import 'package:flutter/material.dart';

class CommonAlertDialog {
  Future showResultDialog(BuildContext context, String title, String content, {int cantidadNivelesRetornar}) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                for (var i = 0; i < cantidadNivelesRetornar; i++) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Ok"),
            ),
          ],
        ),
      );
}
