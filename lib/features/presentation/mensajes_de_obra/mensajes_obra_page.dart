import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plataforma_app/features/domain/entities/mensaje.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/features/presentation/mensajes_de_obra/mensajes_obra_mensaje_item_widgets.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:plataforma_app/features/presentation/mensajes/mensajes_util_widgets.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class MensajesObraPage extends StatelessWidget {
  final String peerId;
  final String peerAvatar;

  const MensajesObraPage({Key key, @required this.peerId, @required this.peerAvatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonPlataformaAppBar(),
      body: ChatScreenPage(
        peerId: peerId,
        peerAvatar: peerAvatar,
      ),
    );
  }
}

class ChatScreenPage extends StatefulWidget {
  final String peerId;
  final String peerAvatar;

  const ChatScreenPage({Key key, @required this.peerId, @required this.peerAvatar}) : super(key: key);

  @override
  State createState() => ChatScreenPageState(peerId: peerId, peerAvatar: peerAvatar);
}

class ChatScreenPageState extends State<ChatScreenPage> {
  ChatScreenPageState({@required this.peerId, @required this.peerAvatar});

  String peerId;
  String peerAvatar;
  String id;

  List<Mensaje> listMessage = List.from([]);
  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId;
  SharedPreferences prefs;

  File imageFile;
  bool isLoading;
  bool isShowSticker;
  String imageUrl;

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  void _scrollListener() {
    if (listScrollController.offset >= listScrollController.position.maxScrollExtent && !listScrollController.position.outOfRange) {
      debugPrint("reach the bottom");
      setState(() {
        debugPrint("reach the bottom");
        _limit += _limitIncrement;
      });
    }
    if (listScrollController.offset <= listScrollController.position.minScrollExtent && !listScrollController.position.outOfRange) {
      debugPrint("reach the top");
      setState(() {
        debugPrint("reach the top");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);

    groupChatId = '';

    isLoading = false;
    isShowSticker = false;
    imageUrl = '';

    readLocal();
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        isShowSticker = false;
      });
    }
  }

  Future readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    if (id.hashCode <= peerId.hashCode) {
      groupChatId = '$id-$peerId';
    } else {
      groupChatId = '$peerId-$id';
    }

    //TODO obtener mensajes y setear datos de cache

    setState(() {});
  }

  Future getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile;

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);

      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        //uploadFile();
      }
    }
  }

  void getSticker() {
    // Hide keyboard when sticker appear
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }

  void onSendMessage(String content, int type) {
    // type: 0 = text, 1 = image, 2 = sticker
    ErrorHandler.showSnackBar(context, 'Nothing to send');
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 && listMessage != null && listMessage[index - 1].remitente != null) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 && listMessage != null && listMessage[index - 1].remitente == null) || index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      //TODO Limpiar datos de chat si corresponde
      Navigator.pop(context);
    }

    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // List of messages
              buildListMessage(),
              // Sticker
              if (isShowSticker) buildSticker() else Container(),
              // Input content
              buildInput(),
            ],
          ),

          // Loading
          buildLoading()
        ],
      ),
    );
  }

  Widget buildInput() {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration:
          const BoxDecoration(border: Border(top: BorderSide(color: palette.BackGround.fondoSinResaltar, width: 0.5)), color: Colors.white),
      child: Row(
        children: <Widget>[
          buildButtonSendImage(),
          buildButtonSendSticker(),
          buildInputTextField(),
          buildButtonSendMessage(),
        ],
      ),
    );
  }

  Flexible buildInputTextField() {
    return Flexible(
      child: TextField(
        onSubmitted: (value) {
          onSendMessage(textEditingController.text, 0);
        },
        style: const TextStyle(color: palette.Text.alternatePrimaryColor, fontSize: 15.0),
        controller: textEditingController,
        decoration: const InputDecoration.collapsed(
          hintText: 'Type your message...',
          hintStyle: TextStyle(color: palette.BackGround.fondoPantallas),
        ),
        focusNode: focusNode,
      ),
    );
  }

  Material buildButtonSendMessage() {
    return Material(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => onSendMessage(textEditingController.text, 0),
          color: palette.Buttons.sinResaltar,
        ),
      ),
    );
  }

  Material buildButtonSendSticker() {
    return buildIconButton(Icons.face, palette.Buttons.sinResaltar, getSticker);
  }

  Material buildButtonSendImage() {
    return buildIconButton(Icons.image, palette.Buttons.sinResaltar, getImage);
  }

  Material buildIconButton(IconData icon, Color color, Function() function) {
    return Material(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        child: IconButton(
          icon: Icon(icon),
          onPressed: function,
          color: color,
        ),
      ),
    );
  }

  Widget buildListMessage() {
    return Flexible(
      child: groupChatId == '' ? buildProgressIndicator() : buildMessagesFromStream(),
    );
  }

  Center buildProgressIndicator() {
    return Center(child: FadingAnimation());
  }

  StreamBuilder buildMessagesFromStream() {
    return StreamBuilder(
      stream: mockMessagesAsStream(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          //Mientras no tengamos los datos mostramos el indicador de progreso
          return buildProgressIndicator();
        } else {
          listMessage.addAll(snapshot.data as List<Mensaje>);
          return Ink(
            color: palette.BackGround.fondoPantallas,
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, index) => buildItem(
                index: index,
                mensaje: snapshot.data[index] as Mensaje,
                lastMessageRight: isLastMessageRight(index),
                textSize: MensajeUtilWidgets().getTextSize(),
              ),
              itemCount: 2,
              reverse: true,
              controller: listScrollController,
            ),
          );
        }
      },
    );
  }

  Stream mockMessagesAsStream() {
    final List<Mensaje> mensajes = [];
    Mensaje mensaje = Mensaje(
        id: 1,
        resumen: 'Resumen de mensaje 1',
        obraId: 1,
        destinatario: 'yo',
        tipoContenido: 'TEXTO',
        fecha: DateTime.now(),
        valor: 'Mensaje 1 de prueba');
    mensajes.add(mensaje);
    mensaje = Mensaje(
        id: 2,
        resumen: 'Resumen de mensaje 2',
        obraId: 1,
        remitente: 'yo',
        tipoContenido: 'TEXTO',
        fecha: DateTime.now(),
        valor: 'Mensaje 2 de respuesta');
    mensajes.add(mensaje);

    return Stream.value(mensajes);
  }

  Widget buildSticker() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: palette.BackGround.fondoPantallas, width: 0.5)), color: palette.BackGround.fondoTarjetas),
      padding: const EdgeInsets.all(5.0),
      height: 180.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildStickerFlatButton('mimi1'),
              buildStickerFlatButton('mimi2'),
              buildStickerFlatButton('mimi3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildStickerFlatButton('mimi4'),
              buildStickerFlatButton('mimi5'),
              buildStickerFlatButton('mimi6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildStickerFlatButton('mimi7'),
              buildStickerFlatButton('mimi8'),
              buildStickerFlatButton('mimi9'),
            ],
          )
        ],
      ),
    );
  }

  FlatButton buildStickerFlatButton(String content) {
    return FlatButton(
      onPressed: () => onSendMessage(content, 2),
      child: Image.asset(
        'assets/images/$content.gif',
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading ? const Text('Loading') : Container(),
    );
  }
}
