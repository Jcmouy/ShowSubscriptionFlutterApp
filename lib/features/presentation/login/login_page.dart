import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/features/presentation/home/home_page.dart';
import 'package:plataforma_app/features/presentation/login/continue_email_page.dart';
import 'package:plataforma_app/features/presentation/login/login_controller.dart';
import 'package:plataforma_app/features/presentation/login/login_states.dart';
import 'package:plataforma_app/features/presentation/confirm_user/confirm_user_page.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/widgets/buttons/common_buttons.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: ProviderListener(
          provider: loginControllerProvider.state,
          onChange: (context, state) {
            if (state is LoginError) {
              ErrorHandler.showErrorSnackBar(context, state.message);
            }
            if (state is LoginSucess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
            if (state is LoginConfirmRegistration) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmUserPage(context.read(loginControllerProvider).loginUser)),
              );
            }
          },
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(loginControllerProvider.state);
              if (state is LoginLoading) {
                return FadingAnimation();
              } else {
                return buildBody(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if (Platform.isAndroid == true) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
    return true;
  }

  Scaffold buildBody(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: SafeArea(
            child: Scaffold(
              backgroundColor: palette.BackGround.fondoPantallas,
              body: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0, bottom: 1, left: 1, right: 1),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const ApplicationLogoBackgroundContainer(),
                                const ApplicationTitleWidget(),
                                const PageTextSeparatorWidget(),
                                buildInkWellManualButton(context),
                                buildInkWellGoogleButton(context),
                                buildInkWellFacebookButton(context),
                                const PageTextSeparatorWidget(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  InkWell buildInkWellManualButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContinueWithEmailPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CommonConfigurableButton(
          buttonText: S.current.button_continue_email,
          assetName: 'assets/images/envelope.svg',
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

  InkWell buildInkWellGoogleButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read(loginControllerProvider).signInWithGoogle();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CommonConfigurableButton(
          buttonText: S.current.button_continue_google,
          assetName: 'assets/images/google_logo.svg',
          backgroundColor: Colors.black54,
        ),
      ),
    );
  }

  InkWell buildInkWellFacebookButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read(loginControllerProvider).signInWithFacebook();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CommonConfigurableButton(
          buttonText: S.current.button_continue_facebook,
          assetName: 'assets/images/facebook_logo.svg',
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
