import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobeTextTheme extends ThemeExtension<GlobeTextTheme> {
  final TextStyle? heading1;
  final TextStyle? heading2;
  final TextStyle? heading3;
  final TextStyle? heading4;
  final TextStyle? heading5;
  final TextStyle? heading6;
  final TextStyle? label;
  final TextStyle? bodyLarge;
  final TextStyle? body;
  final TextStyle? smallBody;
  final TextStyle? bodyLight;

  const GlobeTextTheme({
    this.heading1,
    this.heading2,
    this.heading3,
    this.heading4,
    this.heading5,
    this.heading6,
    this.label,
    this.bodyLarge,
    this.body,
    this.smallBody,
    this.bodyLight,
  });

  GlobeTextTheme.light()
    : heading1 = GoogleFonts.outfit(
        fontSize: 60,
        fontWeight: FontWeight.w500,
        height: 68.0.toDesignHeight(60),
        color: AppColors.colourBlack,
      ),
      heading2 = GoogleFonts.outfit(
        fontSize: 48,
        height: 120.0.toDesignHeight(48),
        fontWeight: FontWeight.w500,
        color: AppColors.colourBlack,
      ),
      heading3 = GoogleFonts.outfit(
        fontSize: 36,
        height: 120.0.toDesignHeight(36),
        fontWeight: FontWeight.w500,
        color: AppColors.colourBlack,
      ),
      heading4 = GoogleFonts.outfit(
        fontSize: 30,
        height: 24.0.toDesignHeight(30),
        fontWeight: FontWeight.w500,
        color: AppColors.colourBlack,
      ),
      heading5 = GoogleFonts.outfit(
        fontSize: 24,
        height: 24.0.toDesignHeight(24),
        fontWeight: FontWeight.w500,
        color: AppColors.colourBlack,
      ),
      heading6 = GoogleFonts.outfit(
        fontSize: 20,
        height: 24.0.toDesignHeight(20),
        fontWeight: FontWeight.w500,
        color: AppColors.colourBlack,
      ),
      label = GoogleFonts.chivoMono(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.colourBlack,
      ),
      bodyLarge = GoogleFonts.inter(
        fontSize: 16,
        height: 24.0.toDesignHeight(16),
        color: AppColors.colourBlack,
      ),
      body = GoogleFonts.inter(
        fontSize: 14,
        height: 24.0.toDesignHeight(14),
        color: AppColors.colourBlack,
      ),
      smallBody = GoogleFonts.inter(
        fontSize: 10,
        height: 16.0.toDesignHeight(10),
        color: AppColors.colourBlack,
      ),
      bodyLight = GoogleFonts.inter(fontSize: 14, color: AppColors.colourBlack);

  GlobeTextTheme.dark()
    : heading1 = GoogleFonts.outfit(
        fontSize: 60,
        fontWeight: FontWeight.w500,
        height: 68.0.toDesignHeight(60),
        color: AppColors.colourWhite,
      ),
      heading2 = GoogleFonts.outfit(
        fontSize: 48,
        height: 120.0.toDesignHeight(48),
        fontWeight: FontWeight.w500,
        color: AppColors.colourWhite,
      ),
      heading3 = GoogleFonts.outfit(
        fontSize: 36,
        height: 120.0.toDesignHeight(36),
        fontWeight: FontWeight.w500,
        color: AppColors.colourWhite,
      ),
      heading4 = GoogleFonts.outfit(
        fontSize: 30,
        height: 24.0.toDesignHeight(30),
        fontWeight: FontWeight.w500,
        color: AppColors.colourWhite,
      ),
      heading5 = GoogleFonts.outfit(
        fontSize: 24,
        height: 24.0.toDesignHeight(24),
        fontWeight: FontWeight.w500,
        color: AppColors.colourWhite,
      ),
      heading6 = GoogleFonts.outfit(
        fontSize: 20,
        height: 24.0.toDesignHeight(20),
        fontWeight: FontWeight.w500,
        color: AppColors.colourWhite,
      ),
      label = GoogleFonts.chivoMono(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.colourWhite,
      ),
      bodyLarge = GoogleFonts.inter(
        fontSize: 16,
        height: 24.0.toDesignHeight(16),
        color: AppColors.colourWhite,
      ),
      body = GoogleFonts.inter(
        fontSize: 14,
        height: 24.0.toDesignHeight(14),
        color: AppColors.colourWhite,
      ),
      smallBody = GoogleFonts.inter(
        fontSize: 10,
        height: 16.0.toDesignHeight(10),
        color: AppColors.colourWhite,
      ),
      bodyLight = GoogleFonts.inter(fontSize: 14, color: AppColors.colourWhite);

  @override
  GlobeTextTheme copyWith({
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? heading6,
    TextStyle? label,
    TextStyle? bodyLarge,
    TextStyle? body,
    TextStyle? smallBody,
    TextStyle? bodyLight,
  }) {
    return GlobeTextTheme(
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      heading5: heading5 ?? this.heading5,
      heading6: heading6 ?? this.heading6,
      label: label ?? this.label,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      body: body ?? this.body,
      smallBody: smallBody ?? this.smallBody,
      bodyLight: bodyLight ?? this.bodyLight,
    );
  }

  @override
  GlobeTextTheme lerp(covariant GlobeTextTheme? other, double t) {
    if (other is! GlobeTextTheme) return this;
    return GlobeTextTheme(
      heading1: TextStyle.lerp(heading1, other.heading1, t),
      heading2: TextStyle.lerp(heading2, other.heading2, t),
      heading3: TextStyle.lerp(heading3, other.heading3, t),
      heading4: TextStyle.lerp(heading4, other.heading4, t),
      heading5: TextStyle.lerp(heading5, other.heading5, t),
      heading6: TextStyle.lerp(heading6, other.heading6, t),
      label: TextStyle.lerp(label, other.label, t),
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t),
      body: TextStyle.lerp(body, other.body, t),
      smallBody: TextStyle.lerp(smallBody, other.smallBody, t),
      bodyLight: TextStyle.lerp(bodyLight, other.bodyLight, t),
    );
  }
}

extension DesignDimension on double {
  double toDesignHeight(double fontSize) => this / fontSize;
}
