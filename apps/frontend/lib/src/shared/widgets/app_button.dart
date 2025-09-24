import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.icon,
    this.isDestructive = false,
  });

  final String text;
  final Widget? icon;
  final void Function()? onPressed;
  final bool isDestructive;

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
        side: BorderSide(
          color: isDestructive ? colorScheme.error : colorScheme.primary,
        ),
        iconAlignment: IconAlignment.end,
      ),
      label: Text(text, style: textTheme.body),
      icon: icon,
    );
  }
}
