import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/presentation/notes/widgets/note_text_editor.dart';
import 'package:frontend/src/presentation/notes/widgets/title_section.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';

class NoteContentArea extends ConsumerWidget {
  const NoteContentArea({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNote = ref.watch(selectedNoteProvider);

    return Padding(
      key: ValueKey(selectedNote.id),
      padding: const EdgeInsets.symmetric(horizontal: 104, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleSection(
            currentTitle: selectedNote.title,
            onTitleChanged: (title) {
              ref.read(selectedNoteProvider.notifier).updateTitle(title);
            },
          ),
          const SizedBox(height: 24),
          NoteTextEditor(
            currentContent: selectedNote.content,
            onContentChanged: (content) {
              ref.read(selectedNoteProvider.notifier).updateContent(content);
            },
          ),
        ],
      ),
    );
  }
}
