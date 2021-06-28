import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plataforma_app/core/util/adapt_screen.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

class FadingAnimation extends StatefulWidget {
  @override
  _FadingAnimationState createState() => _FadingAnimationState();
}

class _FadingAnimationState extends State<FadingAnimation>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.BackGround.fondoTarjetas,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AdaptScreen.px(24),
          vertical: AdaptScreen.px(24),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Image(image: const AssetImage('assets/images/logo_loading.gif'), width: AdaptScreen.px(280), height: AdaptScreen.px(280))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}