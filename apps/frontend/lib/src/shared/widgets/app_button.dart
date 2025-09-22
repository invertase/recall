import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class AppButtton extends StatelessWidget {
  const AppButtton({super.key, this.onPressed, required this.text, this.icon});

  final String text;
  final Widget? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(
          horizontal: context.isMobile ? 24 : 18,
          vertical: context.isMobile ? 24 : 20,
        ),
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: colorScheme.secondary,
        elevation: 0,
        side: BorderSide(color: colorScheme.outline),
        iconAlignment: IconAlignment.end,
      ),
      label: Text(text, style: textTheme.body),
      icon: icon,
    );
  }
}
