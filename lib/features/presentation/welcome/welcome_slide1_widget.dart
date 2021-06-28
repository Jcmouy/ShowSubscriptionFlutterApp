import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plataforma_app/features/presentation/welcome/welcome_styles.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

class WelcomeSlide1 extends StatelessWidget {
  const WelcomeSlide1({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: palette.BackGround.fondoWelcomeSlide1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/theater_f.png',
                  width: 250.0,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                S.current.slide_1_title,
                style: WelcomeStyles.title,
              ),
              Text(
                S.current.slide_1_desc_1,
                style: WelcomeStyles.text,
              ),
              Text(
                S.current.slide_1_desc_2,
                style: WelcomeStyles.text,
              ),
              Text(
                S.current.slide_1_desc_3,
                style: WelcomeStyles.text,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}
