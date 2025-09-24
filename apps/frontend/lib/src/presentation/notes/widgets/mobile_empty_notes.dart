import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class MobileEmptyNote extends StatelessWidget {
  const MobileEmptyNote({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_add_outlined,
              size: 60,
              color: colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            Text(
              'No notes yet',
              style: textTheme.heading3?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Start writing your first note by tapping the "New Note" button below.',
              textAlign: TextAlign.center,
              style: textTheme.body?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
