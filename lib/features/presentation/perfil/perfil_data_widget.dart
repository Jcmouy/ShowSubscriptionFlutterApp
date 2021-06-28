import 'package:flutter/material.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerfilDataWidget extends StatefulWidget {
  const PerfilDataWidget();

  @override
  _PerfilDataWidgetState createState() => _PerfilDataWidgetState();
}

class _PerfilDataWidgetState extends State<PerfilDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10.0),
        buildTitleProfile(context,
            "${context.read(perfilControllerProvider).usuario.firstName} ${context.read(perfilControllerProvider).usuario.lastName}"),
        const SizedBox(height: 5.0),
        buildSubTitleProfile(context, context.read(perfilControllerProvider).pais?.nombre),
        const PageTextSeparatorWidget(),
        const PageTextSeparatorWidget(),
      ],
    );
  }
}
