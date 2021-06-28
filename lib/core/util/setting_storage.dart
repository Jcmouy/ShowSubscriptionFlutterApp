import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:plataforma_app/features/presentation/perfil/alertdialog/options_menu.dart';

class SettingStorage {
  Future<bool> checkAvailableSdCard() async {
    bool sdCard = false;
    final List<String> dirs = [];
    final List<Directory> extDirectories = await getExternalStorageDirectories();
    if (extDirectories.isNotEmpty) {
      for (int i = 0; i < extDirectories.length; i++) {
        dirs.add(extDirectories.toString().split('/')[2]);
      }
    }
    if (dirs.isNotEmpty) {
      for (int i = 0; i < dirs.length; i++) {
        if (dirs[i] != 'emulated' && dirs[i] != 'enc_emulated' && dirs[i] != 'self') {
          sdCard = true;
        }
      }
    }
    return sdCard;
  }

  List<String> getOptions({bool checkSdCard}) {
    List<String> options = [];
    if (checkSdCard) {
      options = OptionsMenu().storage;
    } else {
      final String option = OptionsMenu().storage[0];
      options.add(option);
    }
    return options;
  }
}
