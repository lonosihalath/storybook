import 'package:flutter/material.dart';

class AppColors {
  static Color kPrimaryColor = Colors.orange;
  static Color kPrimaryLight = const Color.fromARGB(255, 255, 176, 57);
  static Color kLigth = const Color(0xFFFFFFFF);
  static Color kBlack = const Color(0xFF000000);
  static Color kTextOrther = const Color(0xFF282929);
  static Color kGley = const Color(0xFFF6F6F6);
  static Color kBackground = const Color(0XFFF6F6F6);
  static Color kSearch = const Color(0XFF282929);
  static Color kHover = const Color(0XFF282929);
  static Color kTextInput = const Color(0XFFB7B7B7);
  static const Color colorSuccess = Color(0xFF12c06a);
  static const Color colorInfo = Color(0xFF0e66d0);
  static const Color colorWarning = Color(0xFFeb8600);
    static const Color colorError = Color(0xFFd00e0e);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
