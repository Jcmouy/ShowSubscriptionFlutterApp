import 'package:flutter/material.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

class CustomApplicationCard extends StatelessWidget {
  final Widget child;
  const CustomApplicationCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: child,
    );
  }
}

class CustomExpandedApplicationCard extends StatelessWidget {
  final Widget child;
  const CustomExpandedApplicationCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}

class CustomFuncionInfoCard extends StatelessWidget {
  final String labelText;
  final String infoText;
  const CustomFuncionInfoCard({Key key, this.labelText, this.infoText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: palette.BackGround.secundario,
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                labelText,
                style: CommonAppStyles.getCardFuncionStyle(),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                infoText,
                style: CommonAppStyles.getCardFuncionStyle(),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
