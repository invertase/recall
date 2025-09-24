import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_checkbox.dart';
import 'package:url_launcher/url_launcher.dart';

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
              TextSpan(
                children: [
                  TextSpan(text: "By signing in, I agree to Globe's\n"),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(
                        'https://github.com/invertase/recall/blob/main/TERMS_OF_SERVICE.md',
                      ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(
                        'https://github.com/invertase/recall/blob/main/PRIVACY_POLICY.md',
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
