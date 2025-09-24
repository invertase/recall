import 'package:flutter/material.dart';
import 'package:frontend/src/presentation/notes/widgets/note_sidebar.dart';
import 'package:frontend/src/presentation/notes/widgets/note_header.dart';
import 'package:frontend/src/presentation/notes/widgets/note_content_area.dart';
import 'package:frontend/src/presentation/notes/widgets/note_footer.dart';

class DesktopNoteContent extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const DesktopNoteContent({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const NoteSidebar(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NoteHeader(onThemeToggle: onThemeToggle),
              const Expanded(child: NoteContentArea()),
              const NoteFooter(),
            ],
          ),
        ),
      ],
    );
  }
}
