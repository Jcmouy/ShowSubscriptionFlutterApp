import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/perfil/alertdialog/change_font.dart';
import 'package:plataforma_app/features/presentation/perfil/alertdialog/change_language.dart';
import 'package:plataforma_app/features/presentation/perfil/alertdialog/change_storage.dart';
import 'package:plataforma_app/features/presentation/perfil/alertdialog/options_menu.dart';
import 'package:plataforma_app/features/presentation/home/app_bottom_navigation_bar.dart';
import 'package:plataforma_app/core/util/setting_storage.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerfilAlertDialog {
  Future showSingleChoiceDialogStorage({BuildContext context, bool checkSdCard}) => showDialog(
      context: context,
      builder: (context) {
        final List<String> options = SettingStorage().getOptions(checkSdCard: checkSdCard);
        return AlertDialog(
            title: Text(S.current.profile_alert_dialog_option_storage_title),
            content: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options
                      .map((e) => RadioListTile(
                            title: Text(e),
                            value: e,
                            groupValue: context.read(changeStorageProvider).currentStorage,
                            selected: context.read(changeStorageProvider).currentStorage == e,
                            onChanged: (value) {
                              if (value != context.read(changeStorageProvider).currentStorage) {
                                context.read(changeStorageProvider).updateStorage(value as String);
                                Navigator.of(context).pop();
                              }
                            },
                          ))
                      .toList(),
                ),
              ),
            ));
      });

  Future showSingleChoiceDialogFont(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(S.current.profile_alert_dialog_option_font_title),
            content: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: OptionsMenu()
                      .font
                      .map((e) => RadioListTile(
                            title: Text(e),
                            value: e,
                            groupValue: context.read(changeFontProvider).currentFont,
                            selected: context.read(changeFontProvider).currentFont == e,
                            onChanged: (value) {
                              if (value != context.read(changeFontProvider).currentFont) {
                                context.read(changeFontProvider).updateFont(value as String);
                                Navigator.of(context).pop();
                              }
                            },
                          ))
                      .toList(),
                ),
              ),
            ));
      });

  Future showSingleChoiceDialogLanguage(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(S.current.profile_alert_dialog_option_language_title),
            content: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Consumer(
                  builder: (context, watch, child) {
                    final changeLanguageProv = watch(changeLanguageProvider(context));
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: OptionsMenu()
                          .language
                          .map((e) => RadioListTile(
                                title: Text(e),
                                value: e,
                                groupValue: changeLanguageProv.currentLanguage,
                                selected: changeLanguageProv.currentLanguage == e,
                                onChanged: (value) {
                                  if (value != changeLanguageProv.currentLanguage) {
                                    changeLanguageProv.updateLanguage(value as String);
                                    Navigator.of(context).pop();
                                    //Navegar nuevamente hacia perfil
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (context) => AppBottomNavigationBar(defaultIndexBottomBar: 2)));
                                  }
                                },
                              ))
                          .toList(),
                    );
                  },
                ),
              ),
            ));
      });
}
