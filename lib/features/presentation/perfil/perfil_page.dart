import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_data_photo_widget.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_data_widget.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_card_widget.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_settings_widget.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_states.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_controller.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        appBar: const CommonPlataformaAppBar(),
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: palette.BackGround.fondoPantallas,
        body: ProviderListener(
          provider: perfilControllerProvider.state,
          onChange: (context, state) {
            if (state is PerfilError) {
              ErrorHandler.showErrorSnackBar(context, state.message);
            }
          },
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(perfilControllerProvider.state);
              if (state is PerfilLoading) {
                return FadingAnimation();
              } else {
                return _buildBody(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final userCall = context.read(perfilControllerProvider).usuario;

    if (userCall == null) return const SizedBox.shrink();

    return Stack(
      children: [
        ListView(
          children: [
            Stack(
              children: [
                const ApplicationPerfilBackgroundBuildContainer(),
                SizedBox(
                  height: 400.0,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(32.0, 140.0, 32.0, 16.0),
                    children: [
                      PerfilDataPhotoWidget(),
                      const PerfilDataWidget(),
                    ],
                  ),
                ),
              ],
            ),
            const PerfilCardWidget(),
            const SizedBox(height: 20.0),
            PerfilSettingsWidget(),
          ],
        ),
      ],
    );
  }
}
