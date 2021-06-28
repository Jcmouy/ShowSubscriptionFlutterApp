import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:intl/intl.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:plataforma_app/features/presentation/mensajes_de_obra/mensajes_obra_page.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:plataforma_app/core/util/adapt_screen.dart';

class ListItemObraSubscriptaWidget extends StatelessWidget {
  final Obra obra;

  const ListItemObraSubscriptaWidget(this.obra);

  @override
  Widget build(BuildContext context) {
    return _buildObraBody(context, obra);
  }

  Container _buildObraBody(BuildContext context, Obra obra) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: palette.LineDivider.lineaDivisorListaMensajes, width: 2.0),
        ),
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MensajesObraPage(peerId: '0', peerAvatar: '')));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: _buildObraListBody(obra),
        ),
      ),
    );
  }

  Row _buildObraListBody(Obra obra) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 6.0, 16.0, 6.0),
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: obra.icono == null
                      ? const Svg('assets/images/profile.svg')
                      : MemoryImage(base64Decode(obra.icono)) as ImageProvider<Object>,
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: AdaptScreen.px(350),
                    child: Text(
                      obra.nombre,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: palette.Text.primaryColor,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  SizedBox(
                    child: Text(
                      DateFormat('dd/MM/yyyy').format(obra.fecha),
                      style: const TextStyle(
                        color: palette.Text.fechaMensajes,
                        fontSize: 9.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                child: Text(
                  obra.descripcion,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: palette.Text.descripcionMensajes,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
