import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/presentation/landing/widgets/theme_toggle.dart';

class NoteMenu extends StatelessWidget {
  const NoteMenu({super.key, required this.onThemeToggle, this.onSignOut});

  final VoidCallback onThemeToggle;
  final VoidCallback? onSignOut;

  static Future<T?> show<T>(
    BuildContext context, {
    required VoidCallback onThemeToggle,
    required VoidCallback? onSignOut,
    required double topOffset,
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder:
          (
            BuildContext buildContext,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return Padding(
              padding: EdgeInsets.only(top: topOffset),
              child: Align(
                alignment: Alignment.topCenter,
                child: NoteMenu(
                  onThemeToggle: onThemeToggle,
                  onSignOut: onSignOut,
                ),
              ),
            );
          },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Material(
      child: Container(
        width: double.infinity,
        color: colorScheme.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NoteMenuOption(
              title: 'My Notes',
              icon: AppIcon.edit(hasColor: false, size: 24),
              onTap: () {
                context.pop();
              },
            ),
            Divider(height: 1, color: colorScheme.outline),
            NoteMenuOption(
              title: 'Sign out',
              icon: const Icon(Icons.close, size: 24),
              onTap: () {
                context.pop();
                onSignOut?.call();
              },
            ),
            Divider(height: 1, color: colorScheme.outline),
            NoteMenuOption(
              title: 'Theme',
              icon: ThemeToggle(onThemeToggle: onThemeToggle),
            ),
          ],
        ),
      ),
    );
  }
}

class NoteMenuOption extends StatelessWidget {
  const NoteMenuOption({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: colorScheme.surface),
        padding: const EdgeInsets.symmetric(vertical: 40),
        width: double.infinity,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: textTheme.body?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 8),
            icon,
          ],
        ),
      ),
    );
  }
}
