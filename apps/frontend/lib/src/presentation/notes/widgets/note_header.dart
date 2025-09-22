import 'package:flutter/material.dart';
import 'package:frontend/src/presentation/landing/widgets/theme_toggle.dart';
import 'package:frontend/src/presentation/notes/widgets/account_dropdown.dart';

class NoteHeader extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const NoteHeader({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const AccountDropdown(),
          const SizedBox(width: 24),
          ThemeToggle(onThemeToggle: onThemeToggle),
        ],
      ),
    );
  }
}
