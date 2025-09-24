import 'package:frontend/src/providers/notes_provider.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';
import 'package:frontend/src/services/notes_service.dart';
import 'package:frontend/src/shared/utils/note_validation.dart';
import 'package:riverpod/experimental/mutation.dart';
import 'package:common/common.dart';

final saveNote = Mutation<Note>();
final deleteNote = Mutation<void>();

Future<void> executeSaveNote(MutationTarget ref) async {
  await saveNote.run(ref, (tsx) async {
    final notesService = tsx.get(notesServiceProvider);
    final selectedNote = tsx.get(selectedNoteProvider);

    final validationError = NoteValidator.validateNote(selectedNote);
    if (validationError != null) {
      throw NoteValidationException(validationError.message);
    }

    final isNewNote = selectedNote.id == null;

    if (isNewNote) {
      final result = await notesService.createNote(
        title: selectedNote.title.trim(),
        content: selectedNote.content.trim(),
      );

      tsx.get(selectedNoteProvider.notifier).selectNote(result);
      tsx.get(notesProvider.notifier).addNote(result);
      return result;
    } else {
      final updatedNote = await notesService.updateNote(
        id: selectedNote.id!,
        title: selectedNote.title.trim(),
        content: selectedNote.content.trim(),
      );

      tsx.get(notesProvider.notifier).updateNote(updatedNote);
      return updatedNote;
    }
  });
}

Future<void> executeDeleteNote(MutationTarget ref, String noteId) async {
  await deleteNote.run(ref, (tsx) async {
    final notesService = tsx.get(notesServiceProvider);
    await notesService.deleteNote(noteId);

    tsx.get(selectedNoteProvider.notifier).clearSelection();
    tsx.get(notesProvider.notifier).removeNote(noteId);
  });
}
