import 'package:flutter/material.dart';
import 'package:plataforma_app/features/domain/entities/social_usuario.dart';
import 'package:plataforma_app/features/presentation/register_persona/register_persona_page.dart';
import 'package:plataforma_app/features/presentation/register_usuario/register_usuario_controller.dart';
import 'package:plataforma_app/features/presentation/register_usuario/register_usuario_states.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/widgets/buttons/common_buttons.dart';
import 'package:plataforma_app/shared/presentation/widgets/textfields/common_text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class RegisterUsuarioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterUsusarioPage();
}

class _RegisterUsusarioPage extends State<RegisterUsuarioPage> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController loginTextController = TextEditingController();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController imagenPathTextController = TextEditingController();
  TextEditingController langKeyTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController password2TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderListener(
        provider: registerUsuarioControllerProvider.state,
        onChange: (context, state) {
          if (state is RegisterUsuarioError) {
            ErrorHandler.showErrorSnackBar(context, state.message);
          }
          if (state is RegisterUsuarioSucess) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterPersonaPage(context.read(registerUsuarioControllerProvider).hashMapPersona,
                      context.read(registerUsuarioControllerProvider).insertedUsuario)),
            );
          }
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(registerUsuarioControllerProvider.state);
            if (state is RegisterUsuarioLoading) {
              return  FadingAnimation();
            } else {
              return _buildRegisterUsusarioPageState(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildRegisterUsusarioPageState(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      buildForm(context),
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

  Form buildForm(BuildContext context) {
    return Form(
      key: _key,
      //TODO deberia ser un scrollable
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            spacing: 15, // to apply margin in the main axis of the wrap
            runSpacing: 15, // to apply margin in the cross axis of the wrap
            children: <Widget>[
              CommonTitleWidget(text: S.current.common_title_register),
              CommonTextFormField(label: S.current.edit_login, hint: S.current.edit_login, controller: loginTextController, required: true),
              CommonTextFormField(
                  label: S.current.edit_firstname, hint: S.current.edit_firstname, controller: firstNameTextController, required: true),
              CommonTextFormField(
                  label: S.current.edit_lastname, hint: S.current.edit_lastname, controller: lastNameTextController, required: true),
              CommonTextFormField(label: S.current.edit_email, hint: S.current.edit_email, controller: emailTextController, required: true),
              CommonPasswordTextFormField(
                  label: S.current.edit_password, hint: S.current.edit_password, controller: passwordTextController),
              CommonPasswordTextFormField(
                  label: S.current.edit_confirm_password, hint: S.current.edit_confirm_password, controller: password2TextController),
              const PageTextSeparatorWidget(),
              buildInkWellRegisterButton(context),
              const BigDataSeparatorWidget(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildInkWellRegisterButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_key.currentState.validate()) {
          final SocialUsuario newUsuario = SocialUsuario(
              login: loginTextController.text,
              firstName: firstNameTextController.text,
              lastName: lastNameTextController.text,
              email: emailTextController.text,
              password: passwordTextController.text);

          context.read(registerUsuarioControllerProvider).registerUser(newUsuario, password2TextController.text);
        }
      },
      child: CommonPrimaryButton(buttonText: S.current.button_text_register, assetName: ''),
    );
  }
}
