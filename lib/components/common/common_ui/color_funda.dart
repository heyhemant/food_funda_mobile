import 'package:flutter/material.dart';

class ColorFunda {
  static final ColorFunda _instance = ColorFunda._internal();

  factory ColorFunda() {
    return _instance;
  }

  ColorFunda._internal();

  // Add your color code variables here
  Color primaryBlack = const Color(0xFF171A1F);
  Color primaryWhite = const Color(0xFFFFFFFF);
  Color secondaryGray = const Color(0xFFBCC1CA);
  Color secondaryBlack = const Color(0xFF9095A0);
  Color lightBlue = const Color(0xFF00BDD6).withOpacity(0.7);
  Color errorRed = const Color(0xFFE53935);
}
