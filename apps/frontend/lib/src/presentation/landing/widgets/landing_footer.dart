import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/social_icons.dart';

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GlobeTheme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        children: [
          if (!context.isMobile) ...[
            const SocialIcons(),
            const SizedBox(height: 24),
          ],
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            children: [
              Text('Recall, built by Globe.', style: textTheme.body),
              Text(
                '© 2025 Dart Globe. All rights reserved.',
                style: textTheme.body,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
