import 'package:flutter/material.dart';

class AppColors {
  static Color primary = Colors.indigo;
  static Color primaryMedium = toRGB("A4CCDA");
  static Color primaryLight = toRGB("00677E");
  static Color primaryBackground = toRGB("f6f6f6");

  static var white = Colors.white;
  static var black = Colors.black;
  static var grey = Colors.grey;
  static var greyLight = toRGB("EAEAEC");
  static var red = Colors.red;
  static var green = Colors.green;
  static var yellow = Colors.yellow;
  static var lightPink = Colors.pink.shade100;

  static Color errorText = Colors.red;
}

Color toRGB(String hexCode) => Color(int.parse('0xff$hexCode'));
