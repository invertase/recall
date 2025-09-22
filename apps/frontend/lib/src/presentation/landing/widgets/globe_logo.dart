import 'package:flutter/material.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';

class GlobeLogo extends StatelessWidget {
  const GlobeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcon.globe(),
        const SizedBox(width: 8),
        AppIcon.globeText(),
      ],
    );
  }
}
