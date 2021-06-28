import 'package:flutter/material.dart';
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

class ListItemsStyles {
  static TextStyle getListviewDescriptionStyle() {
    return const TextStyle(fontSize: 14.0, color: Colors.blueGrey);
  }

  static TextStyle getListviewDateStyle() {
    return const TextStyle(
      fontSize: 14.0,
      color: Colors.blueGrey,
      letterSpacing: 1.5,
    );
  }

  static TextStyle getListviewSubTitleStyle() {
    return const TextStyle(fontSize: 16.0, color: Colors.black45, letterSpacing: 2.0, fontWeight: FontWeight.w300);
  }

  static TextStyle getListviewRowStyle() {
    return const TextStyle(fontSize: 18.0, color: Colors.black45, letterSpacing: 2.0, fontWeight: FontWeight.w300);
  }

  static TextStyle getListViewTitleStyle() {
    return const TextStyle(fontSize: 25.0, color: palette.Text.titleColor, letterSpacing: 2.0, fontWeight: FontWeight.w400);
  }

  static TextStyle getListViewTitleStyle2() {
    return const TextStyle(fontSize: 18.0, color: palette.Text.titleColor, letterSpacing: 2.0, fontWeight: FontWeight.w400);
  }
}
