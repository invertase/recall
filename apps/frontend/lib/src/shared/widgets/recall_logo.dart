import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:google_fonts/google_fonts.dart';

class RecallLogo extends StatelessWidget {
  const RecallLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Row(
      children: [
        AppIcon.recall(size: 30),
        Text(
          'Recall',
          style: GoogleFonts.outfit(
            color: colorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
