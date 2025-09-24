import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class AppIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Animation<double>? opacity;
  final bool hasColor;

  const AppIcon({
    required this.assetName,
    super.key,
    this.width,
    this.height,
    this.opacity,
    this.fit = BoxFit.contain,
    this.hasColor = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    final key = Key('AppIcon-$assetName');

    if (assetName.endsWith('.svg')) {
      return SvgPicture.asset(
        'assets/icons/$assetName',
        key: key,
        width: width,
        height: height,
        colorFilter: !hasColor
            ? ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn)
            : null,
        fit: fit,
      );
    }

    return Image.asset(
      'assets/images/$assetName',
      width: width,
      height: height,
      color: !hasColor ? colorScheme.onSurface : null,
      key: key,
      fit: fit,
      opacity: opacity,
    );
  }

  factory AppIcon.burgerMenu({double? size}) =>
      AppIcon(assetName: 'burger-menu.svg', width: size, height: size);

  factory AppIcon.discord({double? size}) =>
      AppIcon(assetName: 'discord.svg', width: size, height: size);

  factory AppIcon.edit({double? size, bool hasColor = true}) => AppIcon(
    assetName: 'edit.svg',
    width: size,
    height: size,
    hasColor: hasColor,
  );

  factory AppIcon.email({double? size}) =>
      AppIcon(assetName: 'email.svg', width: size, height: size);

  factory AppIcon.font({double? size}) =>
      AppIcon(assetName: 'font.svg', width: size, height: size);

  factory AppIcon.delete({double? size}) =>
      AppIcon(assetName: 'delete.svg', width: size, height: size);

  factory AppIcon.github({double? size}) =>
      AppIcon(assetName: 'github.svg', width: size, height: size);

  factory AppIcon.globe({double? size}) => AppIcon(
    assetName: 'globe.svg',
    width: size,
    height: size,
    hasColor: true,
  );

  factory AppIcon.globeText({double? size}) =>
      AppIcon(assetName: 'globe_text.svg', width: size, height: size);

  factory AppIcon.google({double? size}) => AppIcon(
    assetName: 'google.svg',
    width: size,
    height: size,
    hasColor: true,
  );

  factory AppIcon.link({double? size}) =>
      AppIcon(assetName: 'link.svg', width: size, height: size);

  factory AppIcon.linkedin({double? size}) =>
      AppIcon(assetName: 'linkedin.svg', width: size, height: size);

  factory AppIcon.note({double? size}) =>
      AppIcon(assetName: 'note.svg', width: size, height: size);

  factory AppIcon.recall({double? size}) => AppIcon(
    assetName: 'recall.svg',
    width: size,
    height: size,
    hasColor: true,
  );

  factory AppIcon.save({double? size}) =>
      AppIcon(assetName: 'save.svg', width: size, height: size);

  factory AppIcon.x({double? size}) =>
      AppIcon(assetName: 'x.svg', width: size, height: size);
}
