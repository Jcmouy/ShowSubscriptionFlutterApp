import 'package:plataforma_app/features/presentation/listado_obras/listado_obras_states.dart';
import 'package:plataforma_app/features/presentation/listado_obras/listado_obras_controller.dart';
import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/listado_obras/obras_display_widget.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class ListadoObrasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonPlataformaAppBar(),
      body: ProviderListener(
        provider: listadoObrasControllerProvider.state,
        onChange: (context, state) {
          if (state is ListadoObrasError) {
            ErrorHandler.showErrorSnackBar(context, state.message);
          }
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(listadoObrasControllerProvider.state);
            if (state is ListadoObrasLoading) {
              return FadingAnimation();
            } else {
              return _buildBody(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        ObrasDisplay(obras: context.read(listadoObrasControllerProvider).obras),
        MaterialButton(
          color: Colors.white,
          onPressed: () {
            context.read(listadoObrasControllerProvider).getObras();
          },
          child: const Icon(Icons.search),
        )
      ],
    );
  }
}
