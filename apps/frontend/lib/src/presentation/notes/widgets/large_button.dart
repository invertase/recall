import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
    this.color,
    this.borderColor,
    this.textColor,
  });

  final String text;
  final Widget icon;
  final void Function()? onPressed;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = GlobeTheme.of(context).textTheme;
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor ?? colorScheme.outline),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: textTheme.body?.copyWith(
                    color: textColor ?? colorScheme.onSurface,
                  ),
                ),
                icon,
              ],
            ),
          ),
        ),
      ),
    );
  }

  factory LargeButton.primary({
    Key? key,
    required Widget icon,
    required String text,
    void Function()? onPressed,
  }) => LargeButton(
    key: key,
    text: text,
    icon: icon,
    onPressed: onPressed,
    color: AppColors.purple,
    borderColor: AppColors.purple,
    textColor: AppColors.colourWhite,
  );
}
