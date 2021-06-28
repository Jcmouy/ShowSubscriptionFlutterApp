import 'package:flutter/material.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:plataforma_app/features/presentation/mensajes/listitem_obra_subscripta_widget.dart';
import 'package:plataforma_app/features/presentation/mensajes/mensajes_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViewObrasSubscriptasWidget extends StatefulWidget {
  const ListViewObrasSubscriptasWidget({Key key}) : super(key: key);

  @override
  _ListViewObrasSubscriptasWidgetState createState() => _ListViewObrasSubscriptasWidgetState();
}

class _ListViewObrasSubscriptasWidgetState extends State<ListViewObrasSubscriptasWidget> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ListItemObraSubscriptaWidget createMessageObras(Obra obra) => ListItemObraSubscriptaWidget(obra);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                    //context.read(mensajesControllerProvider).getOrderListByDate(context.read(mensajesControllerProvider).obras.values.toList()).map((obra) => createMessageObras(obra)).toList()),
                    context.read(mensajesControllerProvider).obras.values.toList().map((obra) => createMessageObras(obra)).toList()),
                    //.getOrderListByDate(obras.values.toList())
            ),
          ),
        ),
      ],
    );
  }

  void _scrollListener() {
    if (scrollController.position.maxScrollExtent - scrollController.position.pixels < 10.0) {
      debugPrint(
          'Reached the bottom: cargados: ${context.read(mensajesControllerProvider).countCurrentLoadedItems} - total: ${context.read(mensajesControllerProvider).subscripciones.length}');
      if (context.read(mensajesControllerProvider).countCurrentLoadedItems < context.read(mensajesControllerProvider).subscripciones.length) {
        setState(() {
          context.read(mensajesControllerProvider).loadNext(nextObras: 10);
        });
      }
    }
  }
}
