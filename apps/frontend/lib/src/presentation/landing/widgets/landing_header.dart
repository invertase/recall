import 'package:flutter/material.dart';
import 'package:frontend/src/presentation/landing/widgets/globe_logo.dart';
import 'package:frontend/src/presentation/landing/widgets/theme_toggle.dart';

class LandingHeader extends StatelessWidget {
  const LandingHeader({super.key, this.onThemeToggle});

  final VoidCallback? onThemeToggle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const GlobeLogo(),
          ThemeToggle(onThemeToggle: onThemeToggle),
        ],
      ),
    );
  }
}
