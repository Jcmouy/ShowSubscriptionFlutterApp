import 'package:flutter/material.dart';
import 'package:plataforma_app/features/domain/entities/login_dto.dart';
import 'package:plataforma_app/features/presentation/home/home_page.dart';
import 'package:plataforma_app/features/presentation/login/login_controller.dart';
import 'package:plataforma_app/features/presentation/login/login_states.dart';
import 'package:plataforma_app/features/presentation/register_usuario/register_usuario_page.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/widgets/buttons/common_buttons.dart';
import 'package:plataforma_app/shared/presentation/widgets/textfields/common_text_fields.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class ContinueWithEmailPage extends StatefulWidget {
  const ContinueWithEmailPage({Key key}) : super(key: key);

  @override
  _ContinueWithEmailPageState createState() => _ContinueWithEmailPageState();
}

class _ContinueWithEmailPageState extends State<ContinueWithEmailPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController loginTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderListener(
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
    );
  }

  Widget buildBody(BuildContext context) {
    return buildForm(context);
  }

  Widget buildForm(BuildContext context) {
    return Column(
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
                      Form(
                        key: _key,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0, bottom: 1, left: 1, right: 1),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                const ApplicationLogoBackgroundContainer(),
                                const ApplicationTitleWidget(),
                                buildUserTextField(context),
                                const PageTextSeparatorWidget(),
                                buildPasswordTextField(context),
                                const PageTextSeparatorWidget(),
                                buildInkWellManualButton(context),
                                const BigDataSeparatorWidget(),
                                buildInkWellRegisterButton(context),
                                const PageTextSeparatorWidget(),
                              ],
                            ),
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
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return CommonPasswordTextFormField(label: "Contraseña", hint: "Contraseña", controller: passwordTextController);
  }

  Widget buildUserTextField(BuildContext context) {
    return CommonTextFormField(label: "Login", hint: "Login", controller: loginTextController, required: true);
  }

  InkWell buildInkWellManualButton(BuildContext context) {
    return InkWell(
      onTap: () {
        final LoginDto loginDto = LoginDto(login: loginTextController.text, password: passwordTextController.text);
        context.read(loginControllerProvider).loginManual(loginDto);
      },
      child: const CommonPrimaryButton(buttonText: 'Login', assetName: ''),
    );
  }

  InkWell buildInkWellRegisterButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterUsuarioPage()),
        );
      },
      child: const CommonSecondaryButton(buttonText: 'Register', assetName: ''),
    );
  }
}
