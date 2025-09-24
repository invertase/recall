import 'package:flutter/material.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/action_button.dart';
import 'package:go_router/go_router.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({super.key, this.onDeleteClicked});

  final VoidCallback? onDeleteClicked;

  static Future<void> show(
    BuildContext context, {
    VoidCallback? onDeleteClicked,
  }) => showDialog(
    context: context,
    builder: (context) =>
        DeleteConfirmationDialog(onDeleteClicked: onDeleteClicked),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    return Dialog(
      backgroundColor: colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, size: 20),
                  onPressed: context.pop,
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
            Text('Confirm Deletion', style: textTheme.heading5),
            SizedBox(height: 16),
            Text(
              'This note will be marked for deletion.',
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionButton(text: 'Cancel', onPressed: context.pop),
                SizedBox(width: 16),
                ActionButton(
                  text: 'Delete',
                  isDestructive: true,
                  onPressed: () {
                    context.pop();
                    if (context.isMobile) context.pop();
                    onDeleteClicked?.call();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
