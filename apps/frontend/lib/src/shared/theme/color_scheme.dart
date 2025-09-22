import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';

class GlobeColorScheme extends ThemeExtension<GlobeColorScheme> {
  final Color background;
  final Color surface;
  final Color onSurface;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color outline;

  const GlobeColorScheme({
    required this.background,
    required this.surface,
    required this.onSurface,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.outline,
  });

  GlobeColorScheme.light()
    : background = AppColors.colourWhite,
      surface = AppColors.grey.shade50,
      onSurface = AppColors.colourBlack,
      primary = AppColors.purple,
      onPrimary = AppColors.colourWhite,
      secondary = AppColors.grey,
      onSecondary = AppColors.colourBlack,
      error = const Color(0xFFED1F15),
      onError = AppColors.colourWhite,
      outline = AppColors.grey.shade400;

  GlobeColorScheme.dark()
    : background = AppColors.colourBlack,
      surface = AppColors.grey.shade900,
      onSurface = AppColors.colourWhite,
      primary = AppColors.purple,
      onPrimary = AppColors.colourWhite,
      secondary = AppColors.grey,
      onSecondary = AppColors.colourBlack,
      error = const Color(0xFFED1F15),
      onError = AppColors.colourWhite,
      outline = AppColors.grey.shade800;

  @override
  GlobeColorScheme copyWith({
    Color? background,
    Color? surface,
    Color? onSurface,
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? outline,
  }) {
    return GlobeColorScheme(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      outline: outline ?? this.outline,
    );
  }

  @override
  GlobeColorScheme lerp(covariant GlobeColorScheme? other, double t) {
    if (other is! GlobeColorScheme) return this;
    return GlobeColorScheme(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
    );
  }
}

extension DesignDimension on double {
  double toDesignHeight(double fontSize) => this / fontSize;
}
