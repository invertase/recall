import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:google_fonts/google_fonts.dart';

class RecallLogo extends StatelessWidget {
  const RecallLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Column(
      children: [
        AppIcon.recall(size: context.isMobile ? 84 : 60),
        Transform.translate(
          offset: const Offset(0, -20),
          child: Text(
            'Recall',
            style: GoogleFonts.outfit(
              fontSize: context.isMobile ? 60 : 42,
              fontWeight: FontWeight.w500,
              color: context.isMobile
                  ? colorScheme.onSurface
                  : AppColors.colourBlack,
            ),
          ),
        ),
      ],
    );
  }
}
