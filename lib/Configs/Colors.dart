import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension ColorsConfig on ColorScheme {
  Color get whiteTheme => HexColor("f5f6f8");
  Color get blackTheme => HexColor("4D4D4D");
  Color get goldTheme => HexColor("D7B770");
  Color get blueOldTheme => HexColor("1A4A78");
  Color get grayTitle => HexColor("979797");
  Color get bluelogin => HexColor("0e639e");
  Color get aquaTheme => HexColor("27bbdc");
}
