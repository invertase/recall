import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.isDestructive = false,
    required this.text,
    this.icon,
    this.onPressed,
  });

  final bool isDestructive;
  final String text;
  final Widget? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = GlobeTheme.of(context).textTheme;
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        side: BorderSide(
          color: isDestructive ? colorScheme.error : colorScheme.primary,
        ),
        foregroundColor: colorScheme.onSurface,
        fixedSize: const Size(double.infinity, 40),
      ),
      onPressed: onPressed,
      label: Text(
        text,
        style: textTheme.body?.copyWith(color: colorScheme.onSurface),
      ),
      iconAlignment: IconAlignment.end,
      icon: icon,
    );
  }
}
