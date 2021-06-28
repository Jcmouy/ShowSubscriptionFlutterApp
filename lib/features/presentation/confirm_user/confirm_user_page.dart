import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:plataforma_app/features/domain/entities/social_usuario.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/presentation/confirm_user/confirm_user_controller.dart';
import 'package:plataforma_app/features/presentation/confirm_user/confirm_user_states.dart';
import 'package:plataforma_app/features/presentation/register_persona/register_persona_page.dart';
import 'package:plataforma_app/features/presentation/register_usuario/textfield_icons_util_widget.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/widgets/buttons/common_buttons.dart';
import 'package:plataforma_app/shared/presentation/widgets/textfields/common_text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class ConfirmUserPage extends StatefulWidget {
  final LinkedHashMap hashMapUsuario;

  const ConfirmUserPage(this.hashMapUsuario);

  @override
  State<StatefulWidget> createState() {
    return _ConfirmUserPage();
  }
}

class _ConfirmUserPage extends State<ConfirmUserPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final Usuario currentUser = widget.hashMapUsuario['Usuario'] as Usuario;
    firstNameTextController.text = currentUser.firstName;
    lastNameTextController.text = currentUser.lastName;
    emailTextController.text = currentUser.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderListener(
        provider: confirmUserControllerProvider.state,
        onChange: (context, state) {
          if (state is ConfirmUserError) {
            ErrorHandler.showErrorSnackBar(context, state.message);
          }
          if (state is ConfirmUserSucess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RegisterPersonaPage(widget.hashMapUsuario, context.read(confirmUserControllerProvider).insertedUsuario)),
            );
          }
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(confirmUserControllerProvider.state);
            if (state is ConfirmUserLoading) {
              return FadingAnimation();
            } else {
              return _buildRegisterUserPageState(context);
            }
          },
        ),
      ),
    );
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
              CommonTitleWidget(text: S.current.common_title_confirm),
              CommonSubTitleWidget(text: S.current.common_subtitle_confirm),
              buildRegisterUserTextField(S.current.edit_firstname, "First_Name", firstNameTextController),
              buildRegisterUserTextField(S.current.edit_lastname, "Last_Name", lastNameTextController),
              buildRegisterUserTextField(S.current.edit_email, "Email", emailTextController),
              const PageTextSeparatorWidget(),
              buildInkWellRegisterButton(context),
              const BigDataSeparatorWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRegisterUserTextField([String infoUser, String typeIcon, TextEditingController controller]) {
    return CommonTextField(label: infoUser, hint: infoUser, controller: controller, icon: TextFieldIconsUtilWidget.getFieldIcon(typeIcon));
  }

  InkWell buildInkWellRegisterButton(BuildContext context) {
    return InkWell(
      onTap: () {
        final SocialUsuario newSocialUsuario = SocialUsuario(
            login: (widget.hashMapUsuario['Usuario'] as Usuario).login,
            firstName: firstNameTextController.text,
            lastName: lastNameTextController.text,
            email: emailTextController.text,
            password: (widget.hashMapUsuario['Usuario'] as SocialUsuario).password,
            socialToken: (widget.hashMapUsuario['Usuario'] as SocialUsuario).socialToken);
        context.read(confirmUserControllerProvider).registerUser(newSocialUsuario);
      },
      child: CommonPrimaryButton(buttonText: S.current.button_text_confirm, assetName: ''),
    );
  }
}
