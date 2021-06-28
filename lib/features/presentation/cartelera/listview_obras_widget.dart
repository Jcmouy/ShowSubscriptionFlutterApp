import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_controller.dart';
import 'package:plataforma_app/shared/presentation/widgets/appbar/custom_flexibale_space.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;
import 'package:plataforma_app/core/util/date_utils.dart' as date_utils;
import 'package:plataforma_app/features/presentation/funcion/funcion_page.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_widget_utils.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/core/util/adapt_screen.dart';

class ListOfObrasWidget extends StatefulWidget {
  const ListOfObrasWidget({Key key}) : super(key: key);

  @override
  _ListOfObrasWidgetState createState() => _ListOfObrasWidgetState();
}

class _ListOfObrasWidgetState extends State<ListOfObrasWidget> {
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

    return Container(
        color: palette.BackGround.fondoCartelera,
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 180.0,
              floating: true,
              pinned: true,
              elevation: 50,
              backgroundColor: palette.BackGround.fondoBarras,
              flexibleSpace: CustomFlexibaleSpace(),
            ),
            SliverToBoxAdapter(
              child: Container(
                  color: palette.BackGround.fondoBarras,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                            onPressed: () {},
                            child: Text(S.current.home_features.toUpperCase(),
                                style: const TextStyle(color: palette.BackGround.fondoTarjetas, fontWeight: FontWeight.bold))),
                      ],
                    ),
                  )),
            ),
            SliverToBoxAdapter(
              child: _buildSlider(),
            ),
            SliverToBoxAdapter(
              child: Container(
                  color: palette.BackGround.primario,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                            onPressed: () {},
                            child: Text(S.current.home_catalogue.toUpperCase(),
                                style: const TextStyle(color: palette.BackGround.fondoTarjetas, fontWeight: FontWeight.bold))),
                      ],
                    ),
                  )),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.0, crossAxisSpacing: 10.0, childAspectRatio: 2, crossAxisCount: 1),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return _buildItems(index, context);
                  },
                  childCount: context.read(carteleraControllerProvider).obras.length,
                ),
              ),
            ),
          ],
        ),
    );
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      debugPrint(
          'Reached the bottom: cargados: ${context.read(carteleraControllerProvider).countCurrentLoadedItems} - total: ${context.read(carteleraControllerProvider).funciones.length}');
      if (context.read(carteleraControllerProvider).countCurrentLoadedItems < context.read(carteleraControllerProvider).funciones.length) {
        setState(() {
          context.read(carteleraControllerProvider).loadNextObrasPage();
        });
      }
    }
  }

  Widget _buildSlider() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      height: 300.0,
      child: Swiper(
        autoplay: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return getObraImage(context, context.read(carteleraControllerProvider).getObraIdOfFuncion(index));
        },
        pagination: const SwiperPagination(),
        onTap: (int index) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FuncionPage(index)));
        },
      ),
    );
  }

  Widget _buildItems(int index, BuildContext context) {
    final int obraId = context.read(carteleraControllerProvider).getObraIdOfFuncion(index);
    final _imageWidth = AdaptScreen.px(240);
    final _cardHeight = AdaptScreen.px(500);
    final _borderRadius = AdaptScreen.px(40);
    final _horizontalPadding = AdaptScreen.px(30);
    final _rightPanelPadding = AdaptScreen.px(20);
    final _rightPanelWidth = AdaptScreen.screenW() -
        _imageWidth -
        _horizontalPadding * 2 -
        _rightPanelPadding * 2;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: _horizontalPadding, vertical: AdaptScreen.px(20)),
      height: _cardHeight,
      decoration: BoxDecoration(
          color: palette.BackGround.fondoTarjetas,
          borderRadius: BorderRadius.circular(_borderRadius),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
                offset: Offset(5, 5),
                color: palette.Cards.sombra,
                blurRadius: 5)
          ]),
      child: GestureDetector(
        onTap: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => FuncionPage(index)));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FuncionPage(index)));
        },
        child: Row(children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_imageWidth / 2)),
              child: SizedBox(
                  width: _imageWidth,
                  height: _cardHeight,
                  child: Hero(tag: "item$index", child: getObraImage(context, obraId))
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_rightPanelPadding),
            child: SizedBox(
              width: _rightPanelWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read(carteleraControllerProvider).obras[obraId].nombre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AdaptScreen.px(30),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: AdaptScreen.px(5)),
                  Text(
                    'Disponible ${date_utils.DateUtils.dateToStringSinHora(context.read(carteleraControllerProvider).funciones[index].fecha)}',
                    style: TextStyle(
                        color: palette.Text.textoFechaCategoriaCartelera, fontSize: AdaptScreen.px(18)),
                  ),
                  SizedBox(height: AdaptScreen.px(5)),
                  Text(
                    context.read(carteleraControllerProvider).getListEtiquetas(obraId)
                        .join(' / '),
                    style: TextStyle(
                        fontSize: AdaptScreen.px(18), color: palette.Text.textoFechaCategoriaCartelera),
                  ),
                  SizedBox(height: AdaptScreen.px(20)),
                  Text(
                    context.read(carteleraControllerProvider).obras[obraId].descripcion,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: palette.Text.textoDescripcionCartelera),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
