import 'package:flutter/material.dart';

abstract class AppColors {
  static const colourBlack = Color(0xFF040510);

  static const colourWhite = Color(0xFFF3F3F8);

  static const MaterialColor purple = MaterialColor(0xFF8250CA, {
    50: Color(0xFFEDE1FF),
    100: Color(0xFFE0CBFD),
    200: Color(0xFFC9A8FA),
    300: Color(0xFFBC8DFF),
    400: Color(0xFFA472EB),
    500: Color(0xFF8250CA),
    600: Color(0xFF6333A7),
    700: Color(0xFF48247D),
    800: Color(0xFF3A1A6A),
    900: Color(0xFF260F46),
  });

  static const MaterialColor grey = MaterialColor(0xFF9D9AAE, {
    50: Color(0xFFE5E5F0),
    100: Color(0xFFD7D7E5),
    200: Color(0xFFBDBDCE),
    300: Color(0xFFAEAEC1),
    400: Color(0xFF9D9AAE),
    500: Color(0xFF747187),
    600: Color(0xFF5F5D70),
    700: Color(0xFF434150),
    800: Color(0xFF2E2C3A),
    900: Color(0xFF1F1D2C),
  });
}
