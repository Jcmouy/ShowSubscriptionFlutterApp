import 'package:flutter/material.dart';
import 'package:plataforma_app/core/util/adapt_screen.dart';
import 'package:plataforma_app/shared/presentation/widgets/scrollviewbackground/scroll_view_background.dart';

class FuncionHeaderBackground extends StatefulWidget {
  final ScrollController scrollController;
  final int obraId;
  final ImageProvider<Object> imgenObra;
  const FuncionHeaderBackground({this.scrollController, this.obraId, this.imgenObra});
  @override
  _FuncionHeaderBackground createState() => _FuncionHeaderBackground();
}

class _FuncionHeaderBackground extends State<FuncionHeaderBackground> {
  double postion = 0;
  final _height = AdaptScreen.px(1150).floorToDouble();
  void _imageScroll() {
    if (widget.scrollController.position.pixels <= _height) {
      postion = widget.scrollController.position.pixels;
    }
    setState(() {});
  }

  @override
  void initState() {
    widget.scrollController.addListener(_imageScroll);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_imageScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return widget.obraId == null
        ? Container(
      color: const Color(0xFF607D8B),
      width: AdaptScreen.screenW(),
    )
        : Stack(
      children: [
        Container(
          width: AdaptScreen.screenW(),
          transform: Matrix4.translationValues(0, postion, 0),
          height: _height - postion,
          decoration: BoxDecoration(
            color: const Color(0xFF607D8B),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: widget.imgenObra),
          ),
        ),
        ScrollViewBackGround(
          scrollController: widget.scrollController,
          height: AdaptScreen.px(750).floorToDouble(),
          maxOpacity: 0.8,
        )
      ],
    );
  }
}