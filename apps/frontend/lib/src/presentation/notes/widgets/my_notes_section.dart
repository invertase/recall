import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/presentation/notes/widgets/note_item.dart';
import 'package:frontend/src/providers/notes_provider.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';

class MyNotesSection extends ConsumerWidget {
  const MyNotesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = GlobeTheme.of(context).textTheme;
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final notesAsync = ref.watch(notesProvider);
    final selectedNote = ref.watch(selectedNoteProvider);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppIcon.note(),
              const SizedBox(width: 8),
              Text(
                'My Notes',
                style: textTheme.body?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: notesAsync.when(
              data: (notes) => notes.isEmpty
                  ? Text(
                      'No notes yet',
                      style: textTheme.body?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    )
                  : ListView.separated(
                      itemCount: notes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 4),
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        final isSelected = selectedNote.id == note.id;

                        return NoteItem(
                          title: note.title,
                          isSelected: isSelected,
                          onTap: () {
                            ref
                                .read(selectedNoteProvider.notifier)
                                .selectNote(note);
                          },
                        );
                      },
                    ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Text(
                'Error loading notes',
                style: textTheme.body?.copyWith(color: colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
