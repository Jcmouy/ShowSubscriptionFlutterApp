import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

Image getObraImage(BuildContext context, int index) {
  final String imagen = context.read(carteleraControllerProvider).obras[index].imagen;
  if (imagen == null) {
    return const Svg('assets/images/profile.svg') as Image;
  } else {
    return context.read(carteleraControllerProvider).getObraImageById(index);
  }
}
