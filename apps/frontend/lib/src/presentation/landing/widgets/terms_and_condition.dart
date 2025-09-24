import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_checkbox.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.onCheckboxChanged,
    this.value = false,
  });

  final bool value;
  final void Function(bool?) onCheckboxChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = GlobeTheme.of(context).textTheme;
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Column(
      children: [
        if (!context.isMobile)
          AppCheckbox(value: value, onChanged: onCheckboxChanged),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (context.isMobile)
              AppCheckbox(value: value, onChanged: onCheckboxChanged),
            Text.rich(
              textAlign: context.isMobile ? TextAlign.left : TextAlign.center,
              style: textTheme.smallBody?.copyWith(
                fontSize: 12,
                color: context.isMobile
                    ? colorScheme.onSurface
                    : AppColors.colourBlack,
              ),
              const TextSpan(
                children: [
                  TextSpan(text: "By signing in, I agree to Globe's\n"),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
