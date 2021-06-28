import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/mensajes/listview_obras_subscriptas_widget.dart';
import 'package:plataforma_app/features/presentation/mensajes/mensajes_controller.dart';
import 'package:plataforma_app/features/presentation/mensajes/mensajes_states.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class MensajesPage extends StatefulWidget {
  @override
  _MensajesPageState createState() => _MensajesPageState();
}

class _MensajesPageState extends State<MensajesPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: palette.BackGround.fondoPantallas,
        appBar: const CommonPlataformaAppBar(),
        body: ProviderListener(
          provider: mensajesControllerProvider.state,
          onChange: (context, state) {
            if (state is MensajesError) {
              ErrorHandler.showErrorSnackBar(context, state.message);
            }
          },
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(mensajesControllerProvider.state);
              if (state is MensajesLoading) {
                return FadingAnimation();
              } else {
                return const ListViewObrasSubscriptasWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
