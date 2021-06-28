import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_controller.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_states.dart';
import 'package:plataforma_app/features/presentation/cartelera/listview_obras_widget.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class CarteleraPage extends StatefulWidget {
  @override
  _CarteleraPageState createState() => _CarteleraPageState();
}

class _CarteleraPageState extends State<CarteleraPage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: ProviderListener(
          provider: carteleraControllerProvider.state,
          onChange: (context, state) {
            if (state is CarteleraError) {
              ErrorHandler.showErrorSnackBar(context, state.message);
            }
          },
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(carteleraControllerProvider.state);
              if (state is CarteleraLoading) {
                return FadingAnimation();
              } else {
                return const ListOfObrasWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
