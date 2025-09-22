import 'package:flutter/material.dart';

extension ResponsiveX on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth < 768;
}

class AppBreakpoints {
  const AppBreakpoints._();

  static const double mobile = 767;
  static const double tablet = 1024;
  static const double desktop = 1280;
}
