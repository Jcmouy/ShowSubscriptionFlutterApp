import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plataforma_app/core/util/device_size.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:plataforma_app/features/domain/business/security_service.dart';
import 'package:plataforma_app/features/presentation/home/home_page.dart';
import 'package:plataforma_app/features/presentation/login/login_page.dart';
import 'package:plataforma_app/features/presentation/welcome/welcome_page.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/core/util/adapt_screen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

DeviceSize devSize;

class VideoState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  Future<Timer> startTime() async {
    const _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (checkAlreadyWelcomed()) {
      handleAlreadyWelcomed();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomePage()));
    }
  }

  void handleAlreadyWelcomed() {
    if (checkIsLoggedIn()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  bool checkAlreadyWelcomed() {
    return prefs.wasAlreadyWelcomed();
  }

  bool checkIsLoggedIn() {
    final SecurityService securityService = getIt<SecurityService>();
    return securityService.isLoggedIn();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    AdaptScreen.initContext(context);
    devSize = DeviceSize(
        size: MediaQuery.of(context).size,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        aspectRatio: MediaQuery.of(context).size.aspectRatio);
    return Material(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/images/uydevsPowered.png',
                    height: 75.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/icono_experience_negroazul.svg',
                width: animation.value * 450,
                height: animation.value * 450,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
