import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/perfil/listtile/listtile.dart';
import 'package:plataforma_app/shared/presentation/widgets/cards/custom_cards.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'perfil_controller.dart';

class PerfilCardWidget extends StatefulWidget {
  const PerfilCardWidget();

  @override
  _PerfilCardWidgetState createState() => _PerfilCardWidgetState();
}

class _PerfilCardWidgetState extends State<PerfilCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CustomApplicationCard(
        child: Column(
          children: <Widget>[
            if (!context.read(perfilControllerProvider).usuario.login.contains(constants.GeneralConstants.googleUserPrefix) &&
                !context.read(perfilControllerProvider).usuario.login.contains(constants.GeneralConstants.facebookUserPrefix)) ...[
              buildListTile(context, S.current.profile_card_password),
              const LineDivider(),
            ],
            buildListTile(context, S.current.profile_card_language),
            const LineDivider(),
            buildListTile(context, S.current.profile_card_storage),
            const LineDivider(),
            buildListTile(context, S.current.profile_card_font),
          ],
        ),
      ),
    ]);
  }
}
