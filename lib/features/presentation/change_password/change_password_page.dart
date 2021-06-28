import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/change_password/change_password_controller.dart';
import 'package:plataforma_app/features/presentation/change_password/change_password_states.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_alert_dialog.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/widgets/buttons/common_buttons.dart';
import 'package:plataforma_app/shared/presentation/widgets/dialog/common_alert_dialogs.dart';
import 'package:plataforma_app/shared/presentation/widgets/textfields/common_text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class ChangeUserPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangeUserPasswordPage();
  }
}

class _ChangeUserPasswordPage extends State<ChangeUserPasswordPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController oldPassTextController = TextEditingController();
  TextEditingController newPassTextController = TextEditingController();
  TextEditingController repNewPassTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProviderListener(
        provider: changePasswordControllerProvider.state,
        onChange: (context, state) {
          if (state is ChangePasswordError) {
            ErrorHandler.showErrorSnackBar(context, state.message);
          }
          if (state is ChangePasswordSuccess) {
            CommonAlertDialog().showResultDialog(context, state.title, state.message, cantidadNivelesRetornar: 1);
          }
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(changePasswordControllerProvider.state);
            if (state is ChangePasswordLoading) {
              return FadingAnimation();
            } else {
              return _build(context);
            }
          },
        ),
      ),
    );
  }

  Widget _build(BuildContext context) {
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
              CommonTitleWidget(text: S.current.profile_title_change_pass),
              CommonSubTitleWidget(text: S.current.profile_subtitle_change_pass),
              buildPasswordTextField(S.current.profile_edit_old_pass, S.current.profile_edit_old_pass, oldPassTextController),
              buildPasswordTextField(S.current.profile_edit_new_pass, S.current.profile_edit_new_pass, newPassTextController),
              buildPasswordTextField(S.current.profile_edit_rep_new_pass, S.current.profile_edit_rep_new_pass, repNewPassTextController),
              const PageTextSeparatorWidget(),
              buildInkWellRegisterButton(context),
              const BigDataSeparatorWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(String label, String hint, TextEditingController controller) {
    return CommonPasswordTextFormField(label: label, hint: hint, controller: controller);
  }

  InkWell buildInkWellRegisterButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read(changePasswordControllerProvider)
            .changeUserPassword(oldPassTextController.text, newPassTextController.text, repNewPassTextController.text);
      },
      child: CommonPrimaryButton(buttonText: S.current.edit_confirm_password, assetName: ''),
    );
  }
}
