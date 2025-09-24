import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class LandingHero extends StatelessWidget {
  const LandingHero({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GlobeTheme.of(context).textTheme;

    return SizedBox(
      width: 365,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Take notes with Recall', style: textTheme.heading1),
          const SizedBox(height: 24),
          Text(
            'Recall is a full-stack Dart & Flutter notes app built on Globe, showcasing authentication, database, and AI features (coming soon!).',
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
