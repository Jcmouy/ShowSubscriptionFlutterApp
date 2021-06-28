import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:flutter_svg/flutter_svg.dart';

class CommonPrimaryButton extends StatelessWidget {
  final String buttonText;
  final String assetName;
  final IconData icon;

  const CommonPrimaryButton({Key key, this.buttonText, this.assetName, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonConfigurableButton(
      buttonText: buttonText,
      assetName: assetName,
      backgroundColor: palette.Buttons.primaryBackground,
      fontColor: palette.Buttons.secondaryColor,
      icon: icon,
    );
  }
}

class CommonSecondaryButton extends StatelessWidget {
  final String buttonText;
  final String assetName;
  final IconData icon;

  const CommonSecondaryButton({Key key, this.buttonText, this.assetName, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonConfigurableButton(
      buttonText: buttonText,
      assetName: assetName,
      backgroundColor: palette.Buttons.secondaryBackground,
      fontColor: palette.Buttons.secondaryColor,
      icon: icon,
    );
  }
}

class CommonConfigurableButton extends StatelessWidget {
  final String buttonText;
  final String assetName;
  final Color backgroundColor;
  final Color fontColor;
  final IconData icon;

  const CommonConfigurableButton({Key key, this.buttonText, this.assetName, this.backgroundColor, this.fontColor, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: [
        BoxShadow(color: backgroundColor, spreadRadius: 1),
      ]),
      child: Center(
        child: Wrap(
          children: <Widget>[
            if (assetName.isNotEmpty) SvgPicture.asset(assetName, height: 25, width: 25, semanticsLabel: buttonText),
            if (assetName.isEmpty && icon != null) Icon(icon),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 20.0),
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: fontColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
