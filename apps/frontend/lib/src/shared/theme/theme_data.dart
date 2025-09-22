import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/color_scheme.dart';
import 'package:frontend/src/shared/theme/text_theme.dart';

class GlobeTheme extends ThemeExtension<GlobeTheme> {
  final GlobeTextTheme textTheme;
  final GlobeColorScheme colorScheme;

  const GlobeTheme({required this.textTheme, required this.colorScheme});

  static GlobeTheme of(BuildContext context) {
    return Theme.of(context).extension<GlobeTheme>()!;
  }

  GlobeTheme.light()
    : textTheme = GlobeTextTheme.light(),
      colorScheme = GlobeColorScheme.light();

  GlobeTheme.dark()
    : textTheme = GlobeTextTheme.dark(),
      colorScheme = GlobeColorScheme.dark();

  @override
  GlobeTheme copyWith({
    GlobeTextTheme? textTheme,
    GlobeColorScheme? colorScheme,
  }) {
    return GlobeTheme(
      textTheme: textTheme ?? this.textTheme,
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }

  @override
  GlobeTheme lerp(covariant GlobeTheme? other, double t) {
    if (other is! GlobeTheme) return this;
    return GlobeTheme(
      textTheme: textTheme.lerp(other.textTheme, t),
      colorScheme: colorScheme.lerp(other.colorScheme, t),
    );
  }
}
