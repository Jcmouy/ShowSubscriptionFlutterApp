import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class LoadingHandler {
//Display an AlertDialog with the error message
  static void showLoadingDialog(BuildContext context) {
    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          FadingAnimation(),
          Container(margin: const EdgeInsets.only(left: 7), child: const Text("Loading...")),
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
}
