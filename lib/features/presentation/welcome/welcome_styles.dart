import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

// ignore: avoid_classes_with_only_static_members
class WelcomeStyles {
  static const title = TextStyle(
    fontSize: 40,
    fontFamily: "San Francisco",
    fontWeight: FontWeight.w600,
    color: palette.Text.primaryColor,
  );

  static const text = TextStyle(fontSize: 27, fontFamily: "Roboto", fontWeight: FontWeight.w300, color: palette.Text.alternatePrimaryColor);
}
