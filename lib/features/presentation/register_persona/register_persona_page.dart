import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/presentation/home/home_page.dart';
import 'package:plataforma_app/features/presentation/register_persona/register_persona_controller.dart';
import 'package:plataforma_app/features/presentation/register_persona/register_persona_states.dart';
import 'package:plataforma_app/features/presentation/register_usuario/textfield_icons_util_widget.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/widgets/buttons/common_buttons.dart';
import 'package:plataforma_app/shared/presentation/widgets/textfields/common_text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/core/util/date_utils.dart' as date_utils;
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class RegisterPersonaPage extends StatefulWidget {
  final LinkedHashMap hashMapUsuario;
  final Usuario usuario;

  const RegisterPersonaPage(this.hashMapUsuario, this.usuario);

  @override
  State<StatefulWidget> createState() {
    return _RegisterPersonaPage();
  }
}

class _RegisterPersonaPage extends State<RegisterPersonaPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController birthdayTextController = TextEditingController();
  TextEditingController countryIsoCodeTextController = TextEditingController();
  TextEditingController phoneCodeTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final Persona persona = widget.hashMapUsuario['Persona'] as Persona;

    if (persona.fechaNacimiento != null) {
      birthdayTextController.text = date_utils.DateUtils.dateToString(persona.fechaNacimiento);
    }
    phoneNumberTextController.text = persona.telefono.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: ProviderListener(
          provider: registerPersonaControllerProvider.state,
          onChange: (context, state) {
            if (state is RegisterPersonaError) {
              ErrorHandler.showErrorSnackBar(context, state.message);
            }
            if (state is RegisterPersonaSucess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          },
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(registerPersonaControllerProvider.state);
              if (state is RegisterPersonaLoading) {
                return FadingAnimation();
              } else {
                return _buildRegisterUserPageState(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    //Se quita la confirmacion o registro de usuario del stack segun correspda y se retorna a la pagina anterior
    Navigator.pop(context);
    Navigator.pop(context);
    return Future.value(false);
  }

  Widget _buildRegisterUserPageState(BuildContext context) {
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
              CommonSubTitleWidget(text: S.current.common_subtitle_register),
              buildBirthdayUserTextField(context, birthdayTextController),
              buildPhoneUserTextField(context, phoneCodeTextController, phoneNumberTextController, countryIsoCodeTextController),
              const PageTextSeparatorWidget(),
              buildInkWellRegisterButton(context),
              const BigDataSeparatorWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhoneUserTextField(BuildContext context, TextEditingController phoneCodeController,
      TextEditingController phoneNumberController, TextEditingController countryIsoCodeTextController) {
    return buildPhoneTextField(context, phoneCodeController, phoneNumberController, countryIsoCodeTextController);
  }

  Widget buildBirthdayUserTextField(BuildContext context, TextEditingController controller) {
    return buildBirthdayTextField(context, controller);
  }

  Widget buildRegisterUserTextField([String infoUser, String typeIcon, TextEditingController controller]) {
    return CommonTextField(label: infoUser, hint: infoUser, controller: controller, icon: TextFieldIconsUtilWidget.getFieldIcon(typeIcon));
  }

  InkWell buildInkWellRegisterButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read(registerPersonaControllerProvider)
            .registerPersona(widget.usuario, birthdayTextController.text, phoneCodeTextController.text, phoneNumberTextController.text);
      },
      child: CommonPrimaryButton(buttonText: S.current.button_text_register, assetName: ''),
    );
  }
}
