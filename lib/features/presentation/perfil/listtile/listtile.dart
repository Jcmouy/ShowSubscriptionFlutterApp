import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/perfil/listtile/cupertino_listtile.dart';
import 'package:plataforma_app/features/presentation/perfil/listtile/material_listtile.dart';
import 'package:plataforma_app/generated/l10n.dart';

//TODO sacar la parte de perfil de los list tile de forma que se pueda generalizar y pasar a Shared
Widget buildListTile(BuildContext context, String title) {
  final ThemeData theme = Theme.of(context);
  assert(theme.platform != null);
  switch (theme.platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      if (title != S.current.profile_card_storage) {
        final cupertinoListTile = CupertinListTile(title: title);
        return cupertinoListTile;
      }
      return const SizedBox.shrink();
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
    default:
      final materialListTile = MaterialListTile(title: title);
      return materialListTile;
  }
}
