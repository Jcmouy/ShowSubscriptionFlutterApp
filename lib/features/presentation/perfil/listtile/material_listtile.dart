import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/change_password/change_password_page.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/core/util/setting_storage.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_alert_dialog.dart';

class MaterialListTile extends StatelessWidget {
  final String title;

  const MaterialListTile({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon(title),
        color: Colors.blue[800],
      ),
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        tileTapped(context, title);
      },
    );
  }

  static void tileTapped(BuildContext context, String title) {
    if (title == S.current.profile_card_password) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeUserPasswordPage()));
    } else if (title == S.current.profile_card_language) {
      PerfilAlertDialog().showSingleChoiceDialogLanguage(context);
    } else if (title == S.current.profile_card_storage) {
      SettingStorage()
          .checkAvailableSdCard()
          .then((result) => {PerfilAlertDialog().showSingleChoiceDialogStorage(context: context, checkSdCard: result)});
    } else {
      PerfilAlertDialog().showSingleChoiceDialogFont(context);
    }
  }

  static IconData icon(String title) {
    IconData icon;
    if (title == S.current.profile_card_password) {
      icon = Icons.lock_outline;
    } else if (title == S.current.profile_card_language) {
      icon = Icons.language;
    } else if (title == S.current.profile_card_storage) {
      icon = Icons.storage;
    } else {
      icon = Icons.font_download;
    }
    return icon;
  }
}
