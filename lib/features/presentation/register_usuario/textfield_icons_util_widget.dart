import 'package:flutter/material.dart';

class TextFieldIconsUtilWidget {
  static Icon getFieldIcon(String typeIcon) {
    Icon icon;
    switch (typeIcon) {
      case 'First_Name':
        icon = const Icon(Icons.account_box);
        break;
      case 'Last_Name':
        icon = const Icon(Icons.account_box);
        break;
      case 'Date_of_birth':
        icon = const Icon(Icons.calendar_today);
        break;
      case 'Email':
        icon = const Icon(Icons.email);
        break;
      case 'Phone':
        icon = const Icon(Icons.phone);
        break;
      default:
        icon = const Icon(Icons.add_circle_outlined);
    }
    return icon;
  }
}
