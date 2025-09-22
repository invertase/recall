import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/social_icons.dart';

class NoteFooter extends StatelessWidget {
  const NoteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 0, right: 48, top: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SocialIcons(),
          const SizedBox(height: 12),
          Text(
            '© 2025 Dart Globe. All rights reserved.',
            style: textTheme.body?.copyWith(color: colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
