
import 'package:flutter/material.dart';

bool setModeTheme = true;
final mainThemeColor = MainColor();
final subThemeColor = SubColor();
final spreadColor = SpreadColor();
final baseColor = LightModeColor();
class MainColor {
  // final mainColor = const Color(0xFF408CFF);
  final mainColor = const Color(0xFF408CFF);
  final subMainColor = const Color(0xFF2CC0FF);
}

class SubColor {
  final mainColor = const Color(0xFFFFA800);
  final subMainColor = const Color(0xFFFDC830);
}

class SpreadColor {
    final mainColor =  const Color(0xFF85D700);
  final subMainColor =  const Color(0xFF00B05B);
}
class LightModeColor {
  final colorMax = const Color(0xFFFFFFFF);
  final colorMiddle = const Color(0xFFEBEBEB);
  final colorSmooth = const Color(0xFFD2D2D2);
  final colorLow = const Color(0xFF8D8D8D);
}

class DarkModeColor {
  final colorMax = const Color.fromARGB(255, 54, 54, 54);
  final colorMiddle = const Color(0xFF6C6C6C);
  final colorSmooth = const Color(0xFF7C7C7C);
  final colorLow = const Color(0xFFB2B2B2);
}