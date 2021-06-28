import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/mensajes/mensajes_page.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_page.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_page.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

/// This is the stateful widget that the main application instantiates.
//ignore: must_be_immutable
class AppBottomNavigationBar extends StatefulWidget {
  final int defaultIndexBottomBar;
  int _selectedIndex;

  AppBottomNavigationBar({this.defaultIndexBottomBar, Key key}) : super(key: key) {
    _selectedIndex = defaultIndexBottomBar;
  }

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  static final List<Widget> _widgetOptions = <Widget>[
    MensajesPage(),
    CarteleraPage(),
    PerfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[_widgetOptions.elementAt(widget._selectedIndex)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.message_rounded),
            label: S.current.menu_messages,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.theaters),
            label: S.current.menu_billboard,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_rounded),
            label: S.current.menu_profile,
          ),
        ],
        backgroundColor: palette.BackGround.fondoBarras,
        currentIndex: widget._selectedIndex,
        selectedItemColor: palette.Text.textoBarras,
        unselectedItemColor: palette.Text.textoBarrasSinResaltar,
        onTap: _onItemTapped,
      ),
    );
  }
}
