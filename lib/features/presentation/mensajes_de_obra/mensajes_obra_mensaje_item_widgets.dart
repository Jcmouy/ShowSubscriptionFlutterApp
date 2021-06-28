import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plataforma_app/features/domain/entities/mensaje.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

Widget buildItem({int index, Mensaje mensaje, bool lastMessageRight, double textSize}) {
  if (mensaje.remitente != null) {
    // Right (my message)
    return buildRightMessage(mensaje: mensaje, index: index, lastMessageRight: lastMessageRight, textSize: textSize);
  } else {
    // Left (peer message)
    return buildLeftMessage(index: index, mensaje: mensaje, lastMessageRight: lastMessageRight, textSize: textSize);
  }
}

Row buildRightMessage({Mensaje mensaje, int index, bool lastMessageRight, double textSize}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[buildMessage(mensaje: mensaje, index: index, lastMessageOnRight: lastMessageRight, selectedTextSize: textSize)],
  );
}

Container buildLeftMessage({int index, Mensaje mensaje, bool lastMessageRight, double textSize}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            if (!lastMessageRight) buildLastMessagePhotoOnLeft() else Container(width: 35.0),
            buildMessage(mensaje: mensaje, index: index, lastMessageOnRight: lastMessageRight, selectedTextSize: textSize),
          ],
        ),

        // Time
        if (!lastMessageRight) buildMessageDateTimeText(mensaje) else Container()
      ],
    ),
  );
}

Container buildMessageDateTimeText(Mensaje mensaje) {
  return Container(
    margin: const EdgeInsets.only(left: 50.0, top: 5.0, bottom: 5.0),
    child: Text(
      DateFormat('dd MMM kk:mm').format(mensaje.fecha),
      style: const TextStyle(color: palette.Text.alternatePrimaryColor, fontSize: 12.0, fontStyle: FontStyle.italic),
    ),
  );
}

Material buildLastMessagePhotoOnLeft() {
  return const Material(
    // TODO agregar imagen
    // child: CachedNetworkImage(
    //   placeholder: (context, url) => Container(
    //     child: FadingAnimation(
    //       strokeWidth: 1.0,
    //       valueColor:
    //       AlwaysStoppedAnimation<Color>(themeColor),
    //     ),
    //     width: 35.0,
    //     height: 35.0,
    //     padding: EdgeInsets.all(10.0),
    //   ),
    //   imageUrl: peerAvatar,
    //   width: 35.0,
    //   height: 35.0,
    //   fit: BoxFit.cover,
    // ),
    borderRadius: BorderRadius.all(
      Radius.circular(18.0),
    ),
    clipBehavior: Clip.hardEdge,
  );
}

Widget buildMessage({Mensaje mensaje, int index, bool lastMessageOnRight, double selectedTextSize}) {
  final double margen = lastMessageOnRight ? 20.0 : 10.0;
  final double textS = selectedTextSize;

  final TextStyle estiloMensaje = TextStyle(color: palette.Text.alternatePrimaryColor, fontSize: textS);
  switch (mensaje.tipoContenido) {
    case 'TEXTO':
      return buildMensajeTextWidget(mensaje, index, margen, estiloMensaje);
    case 'AUDIO': //Imagen
      return buildMensajePhotoWidget(mensaje, index, margen);
    default: //Emoticon
      return buildMensajeStickerWidget(mensaje, index, margen);
  }
}

Container buildMensajeStickerWidget(Mensaje mensaje, int index, double margen) {
  return Container(
    margin: getMensajeMargin(margen),
    child: Image.asset(
      'images/${mensaje.valor}',
      width: 100.0,
      height: 100.0,
      fit: BoxFit.cover,
    ),
  );
}

Container buildMensajePhotoWidget(Mensaje mensaje, int index, double margen) {
  return Container(
    margin: getMensajeMargin(margen),
    child: FlatButton(
      onPressed: () {
        //Do Nothing por ahora
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => FullPhoto(
        //             url: mensaje.data()['content'])));
      },
      padding: const EdgeInsets.all(0),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          'images/img_not_available.jpeg',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
        //     Material(
        // child: CachedNetworkImage(
        //   placeholder: (context, url) => Container(
        //     child: FadingAnimation(
        //       valueColor:
        //       AlwaysStoppedAnimation<Color>(themeColor),
        //     ),
        //     width: 200.0,
        //     height: 200.0,
        //     padding: EdgeInsets.all(70.0),
        //     decoration: BoxDecoration(
        //       color: greyColor2,
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(8.0),
        //       ),
        //     ),
        //   ),
        //   errorWidget: (context, url, error) => Material(
        //     child: Image.asset(
        //       'images/img_not_available.jpeg',
        //       width: 200.0,
        //       height: 200.0,
        //       fit: BoxFit.cover,
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(8.0),
        //     ),
        //     clipBehavior: Clip.hardEdge,
        //   ),
        //   imageUrl: mensaje.data()['content'],
        //   width: 200.0,
        //   height: 200.0,
        //   fit: BoxFit.cover,
        // ),
      ),
    ),
  );
}

Container buildMensajeTextWidget(Mensaje mensaje, int index, double margen, TextStyle estiloMensaje) {
  return Container(
    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
    width: 200.0,
    decoration: BoxDecoration(color: palette.BackGround.fondoTarjetas, borderRadius: BorderRadius.circular(8.0)),
    margin: getMensajeMargin(margen),
    child: Text(
      mensaje.valor,
      style: estiloMensaje,
    ),
  );
}

EdgeInsets getMensajeMargin(double margen) {
  return EdgeInsets.only(bottom: margen, right: 10.0);
}
