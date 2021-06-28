import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:plataforma_app/core/helpers/shared_preferences_helper.dart';
import 'package:plataforma_app/shared/presentation/widgets/utils/dot_widget.dart';
import 'package:plataforma_app/features/presentation/welcome/welcome_slide1_widget.dart';
import 'package:plataforma_app/features/presentation/welcome/welcome_slide2_widget.dart';
import 'package:plataforma_app/features/presentation/welcome/welcome_slide3_widget.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/features/presentation/login/login_page.dart';

Locale _userLocale;

class WelcomePage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => WelcomePage(),
    );
  }

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int page = 0;
  List<Widget> pages;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final newLocale = Localizations.localeOf(context);

    if (newLocale != _userLocale) {
      _userLocale = newLocale;

      pages = [
        WelcomeSlide1(context: context),
        WelcomeSlide2(context: context),
        WelcomeSlide3(context: context),
      ];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const double paddingConstant = 20;

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              onPageChangeCallback: pageChangeCallback,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
              enableLoop: false,
            ),
            Padding(
              padding: const EdgeInsets.all(paddingConstant),
              child: Column(
                children: <Widget>[
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length, (index) => dotWidget(page, index)),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    liquidController.animateToPage(page: pages.length - 1, duration: 500);
                  },
                  color: Colors.white.withOpacity(0.01),
                  child: Text(S.current.pg_skip),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    if (page != 2) {
                      liquidController.jumpToPage(page: liquidController.currentPage + 1);
                    } else {
                      prefs.markWelcomed();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  color: Colors.white.withOpacity(0.01),
                  child: page != 2 ? Text(S.of(context).pg_next) : Text(S.of(context).pg_understood),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
