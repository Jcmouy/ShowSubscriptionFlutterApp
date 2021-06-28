import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_controller.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_states.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_widget_utils.dart';
import 'package:plataforma_app/features/presentation/funcion/funcion_header_background.dart';
import 'package:plataforma_app/features/presentation/funcion/funcion_header_title.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/widgets/buttons/common_buttons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:plataforma_app/shared/presentation/widgets/expandableText/expandable_text.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';
import 'package:plataforma_app/core/util/adapt_screen.dart';
import 'package:plataforma_app/shared/presentation/widgets/dialog/common_alert_dialogs.dart';

class FuncionPage extends StatefulWidget {
  final int index;
  const FuncionPage(this.index);

  @override
  _FuncionPageState createState() => _FuncionPageState();
}

class _FuncionPageState extends State<FuncionPage>{
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final int obraId = context.read(carteleraControllerProvider)
        .getObraIdOfFuncion(widget.index);
    ImageProvider<Object> imgenObra = getObraImage(context, obraId).image;


    return Scaffold(
      backgroundColor: palette.BackGround.fondoTarjetas,
      body: ProviderListener(
        provider: carteleraControllerProvider.state,
        onChange: (context, state) {
          if (state is CarteleraError) {
            ErrorHandler.showErrorSnackBar(context, state.message);
          }
          if (state is CarteleraSuccess) {
            CommonAlertDialog().showResultDialog(context, state.title, state.message, cantidadNivelesRetornar: 1);
          }
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(carteleraControllerProvider.state);
            if (state is CarteleraLoading) {
              return FadingAnimation();
            } else {
              return _buildForm(obraId, context, imgenObra);
            }
          },
        ),
      ),
    );
  }

  Stack _buildForm(int obraId, BuildContext context, ImageProvider<Object> imgenObra) {
    final _height = AdaptScreen.px(1150);

    return Stack(children: [
      Container(
        color: palette.BackGround.fondoBarras,
        child: CustomScrollView(
            controller: scrollController,
            physics: ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 600),
                      child: SizedBox(
                        height: _height,
                        child: FuncionHeaderBackground(
                          scrollController: scrollController,
                          obraId: obraId,
                          imgenObra: imgenObra,
                        ),
                      ),
                    ),
                    FuncionHeaderTitle(
                      index: widget.index,
                      obraId: obraId,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AdaptScreen.px(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: AdaptScreen.px(30)),
                      Text(
                        S.current.function_description,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: AdaptScreen.px(28)),
                      ),
                      SizedBox(height: AdaptScreen.px(20)),
                      ExpandableText(
                        context.read(carteleraControllerProvider).obras[obraId].descripcion ?? '',
                        maxLines: 5,
                        style: const TextStyle(color: palette.Text.textoBarras, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AdaptScreen.px(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: AdaptScreen.px(30)),
                      Text(
                        S.current.function_starring,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: AdaptScreen.px(28)),
                      ),
                      SizedBox(height: AdaptScreen.px(20)),
                      ExpandableText(
                        context.read(carteleraControllerProvider).obras[obraId].protagonistas ?? '',
                        maxLines: 5,
                        style: const TextStyle(color: palette.Text.textoBarras, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AdaptScreen.px(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: AdaptScreen.px(30)),
                      Text(
                        S.current.function_address,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: AdaptScreen.px(28)),
                      ),
                      SizedBox(height: AdaptScreen.px(20)),
                      ExpandableText(
                        context.read(carteleraControllerProvider).obras[obraId].direccion ?? '',
                        maxLines: 5,
                        style: const TextStyle(color: palette.Text.textoBarras, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AdaptScreen.px(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: AdaptScreen.px(30)),
                      buildInkWellSubscriptionButton(context, widget.index, obraId),
                      SizedBox(height: AdaptScreen.px(30)),
                    ],
                  ),
                ),
              ),
              //viewService.buildComponent('appbar')
            ]
        ),
      ),
    ],);
  }

  InkWell buildInkWellSubscriptionButton(BuildContext context, int index,
      int obraId) {
    return InkWell(
      onTap: () {
        try {
          context.read(carteleraControllerProvider).subscribe(index, obraId);
        } catch (e) {
          // Do Nothing por ahora
        }
      },
      child: CommonPrimaryButton(
        buttonText: S.current.button_text_subscribe,
        assetName: '',
        icon: Icons.subscriptions,
      ),
    );
  }
}



  
  
