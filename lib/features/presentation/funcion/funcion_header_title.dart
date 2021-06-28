import 'package:flutter/material.dart';
import 'package:plataforma_app/core/util/adapt_screen.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:plataforma_app/features/presentation/cartelera/cartelera_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/core/util/date_utils.dart' as date_utils;

class FuncionHeaderTitle extends StatelessWidget {
  final int index;
  final int obraId;

  const FuncionHeaderTitle({this.index,this.obraId,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AdaptScreen.screenW(),
      height: AdaptScreen.px(200),
      padding: EdgeInsets.fromLTRB(AdaptScreen.px(40), AdaptScreen.px(40), AdaptScreen.px(40), 0),
      decoration: BoxDecoration(
          color: palette.BackGround.fondoBarras,
          //border: Border.all(color: _theme.backgroundColor),
          borderRadius:
          BorderRadius.vertical(top: Radius.circular(AdaptScreen.px(50)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: AdaptScreen.px(600),
            child: Text(
              context.read(carteleraControllerProvider).obras[obraId].nombre ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: AdaptScreen.px(40), fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: AdaptScreen.px(10),
          ),
          Text(
            date_utils.DateUtils.dateToStringSinHora(context.read(carteleraControllerProvider).funciones[index].fecha),
          ),
          SizedBox(
            height: AdaptScreen.px(10),
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: palette.Text.textoBarras),
              children: <TextSpan>[
                TextSpan(
                    text: context.read(carteleraControllerProvider).getListEtiquetas(obraId).join(' / ') ??
                        ''),
                const TextSpan(text: ' · '),
                TextSpan(text: context.read(carteleraControllerProvider).obras[obraId].duracion)
              ],
            ),
          ),
          SizedBox(
            height: AdaptScreen.px(10),
          ),
        ],
      ),
    );
  }
}