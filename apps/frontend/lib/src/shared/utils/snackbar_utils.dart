import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';

class SnackbarUtils {
  static void showError(BuildContext context, String message) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: colorScheme.onError, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: textTheme.body?.copyWith(color: colorScheme.onError),
              ),
            ),
          ],
        ),
        backgroundColor: colorScheme.error,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: colorScheme.onPrimary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: textTheme.body?.copyWith(color: colorScheme.onPrimary),
              ),
            ),
          ],
        ),
        backgroundColor: colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showInfo(BuildContext context, String message) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info_outline, color: colorScheme.onSurface, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: textTheme.body?.copyWith(color: colorScheme.onSurface),
              ),
            ),
          ],
        ),
        backgroundColor: colorScheme.surface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
