library apppalette;

import 'package:flutter/material.dart';

class _AppColors {
  static const Color azul = Color(0xFF007BA4);
  static const Color amarillo = Color(0xFFFFC909);
  static const Color turquesa = Color(0xFF47B5BE);
  static const Color gris = Color(0xFF3C3C3B);
}

class ThemeNegroAzul {
  static const Color waveClipperGradienteOscuraInicial = _AppColors.azul;
  static const Color waveClipperGradienteOscuraFinal = _AppColors.gris;
  static const Color waveClipperGradienteClaraInicial = BackGround.fondoTarjetas;
  static const Color waveClipperGradienteClaraFinal = BackGround.fondoSinResaltar;
}

//TODO hacer que sea configurable el tema
//TODO hacer que sea configurable que svg se utiliza en el login para poder machearlo con los fondos seleccionados
// ----------------VARIANTE 1------------------------------
class Iconos {
  static const Color optional = _AppColors.turquesa;
  static const Color funcionDisponible = _AppColors.amarillo;
  static const Color funcionDescripcion = _AppColors.turquesa;
  static const Color funcionDireccion = _AppColors.azul;
  static const Color funcionProtagonistas = BackGround.fondoWelcomeSlide1;
  static const Color funcionDuraccion = BackGround.fondoWelcomeSlide2;
  static const Color funcionEtiquetas = BackGround.fondoWelcomeSlide3;
}

class Cards {
  static const Color titulo = _AppColors.turquesa;
  static const Color sombra = Color(0xFF303030);
}

class LineDivider {
  static const Color lineaDivisorListaMensajes = BackGround.secundario;
}

class Buttons {
  static const Color primaryBackground = _AppColors.turquesa;
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color secondaryBackground = Color(0xFFE0E0E0);
  static const Color secondaryColor = Color(0xFF000000);
  static const Color sinResaltar = Color(0xFF607D8B);
}

class BackGround {
  static const Color primario = _AppColors.gris;
  static const Color secundario = _AppColors.azul;
  static const Color terciario = _AppColors.amarillo;
  static const Color fondoPantallas = _AppColors.gris;
  static const Color fondoSinResaltar = Color(0xFFBDBDBD);
  static const Color fondoTarjetas = Colors.white;
  static const Color fondoBarras = _AppColors.azul;
  static const Color fondoLogoLogin = _AppColors.gris;
  static const Color fondoWelcomeSlide1 = Colors.amberAccent;
  static const Color fondoWelcomeSlide2 = Colors.greenAccent;
  static const Color fondoWelcomeSlide3 = Colors.pink;
  static const Color fondoCartelera = Color(0xFFF5F5F5);
}

class Text {
  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = _AppColors.turquesa;
  static const Color terciarioColor = _AppColors.amarillo;
  static const Color titleColor = _AppColors.turquesa;
  static const Color alternatePrimaryColor = _AppColors.gris;
  static const Color textoBarras = Colors.white;
  static const Color textoBarrasSinResaltar = _AppColors.gris;
  static const Color textoTituloFuncion = Buttons.secondaryColor;
  static const Color textoSubTituloFuncion = Color(0xFFC4C5C9);
  static const Color descripcionMensajes = Colors.white70;
  static const Color fechaMensajes = Colors.white30;
  static const Color textoDescripcionCartelera = Color(0xFF717171);
  static const Color textoFechaCategoriaCartelera = Color(0xFF9E9E9E);

}
// ----------------VARIANTE 2------------------------------
/*
class BackGround {
  static const Color primario = Colors.white;
  static const Color secundario = _AppColors.azul;
  static const Color terciario = _AppColors.amarillo;
  static const Color fondoPantallas = Colors.white;
  static const Color fondoSinResaltar = Color(0xFFBDBDBD);
  static const Color fondoTarjetas = Colors.white;
  static const Color fondoBarras = _AppColors.gris;
  static const Color fondoLogoLogin = _AppColors.gris;
  static const Color fondoWelcomeSlide1 = Colors.amberAccent;
  static const Color fondoWelcomeSlide2 = Colors.greenAccent;
  static const Color fondoWelcomeSlide3 = Colors.pink;
  static const Color fondoCartelera = Color(0xFFF5F5F5);
}

class Text {
  static const Color primaryColor = _AppColors.gris;
  static const Color secondaryColor = _AppColors.turquesa;
  static const Color terciarioColor = _AppColors.amarillo;
  static const Color titleColor = _AppColors.turquesa;
  static const Color alternatePrimaryColor = _AppColors.gris;
  static const Color textoBarras = _AppColors.amarillo;
  static const Color textoBarrasSinResaltar = Colors.white;
  static const Color textoTituloFuncion = Buttons.secondaryColor;
  static const Color textoSubTituloFuncion = Color(0xFFC4C5C9);
  static const Color descripcionMensajes = Colors.white70;
  static const Color fechaMensajes = Colors.white30;
  static const Color textoDescripcionCartelera = Color(0xFF717171);
  static const Color textoFechaCategoriaCartelera = Color(0xFF9E9E9E);
}
*/
// ----------------VARIANTE 3------------------------------
/*
class BackGround {
  static const Color primario = Colors.white;
  static const Color secundario = _AppColors.amarillo;
  static const Color terciario = _AppColors.amarillo;
  static const Color fondoPantallas = Colors.white;
  static const Color fondoSinResaltar = Color(0xFFBDBDBD);
  static const Color fondoTarjetas = Colors.white;
  static const Color fondoBarras = _AppColors.azul;
  static const Color fondoLogoLogin = _AppColors.azul;
  static const Color fondoWelcomeSlide1 = Colors.amberAccent;
  static const Color fondoWelcomeSlide2 = Colors.greenAccent;
  static const Color fondoWelcomeSlide3 = Colors.pink;
}

class Text {
  static const Color primaryColor = _AppColors.gris;
  static const Color secondaryColor = _AppColors.turquesa;
  static const Color terciarioColor = _AppColors.amarillo;
  static const Color titleColor = _AppColors.amarillo;
  static const Color alternatePrimaryColor = _AppColors.gris;
  static const Color textoBarras = Colors.white;
  static const Color textoBarrasSinResaltar = _AppColors.gris;
  static const Color textoTituloFuncion = Buttons.secondaryColor;
  static const Color textoSubTituloFuncion = Color(0xFFC4C5C9);
  static const Color descripcionMensajes = Colors.white70;
  static const Color fechaMensajes = Colors.white30;
}
*/
