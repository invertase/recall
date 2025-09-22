import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.icon, this.onTap});

  final AppIcon icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colorScheme.background,
          border: Border.all(color: colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon,
      ),
    );
  }
}
