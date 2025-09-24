import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:common/common.dart';
import 'package:frontend/src/services/notes_service.dart';

class NotesNotifier extends AsyncNotifier<List<Note>> {
  @override
  Future<List<Note>> build() async {
    final notesService = ref.watch(notesServiceProvider);
    return await notesService.getNotes();
  }

  void addNote(Note note) {
    state = AsyncValue.data([note, ...state.value ?? []]);
  }

  void updateNote(Note updatedNote) {
    final updatedNotes = (state.value ?? []).map((note) {
      return note.id == updatedNote.id ? updatedNote : note;
    }).toList();
    state = AsyncValue.data(updatedNotes);
  }

  void removeNote(String id) {
    final updatedNotes = (state.value ?? [])
        .where((note) => note.id != id)
        .toList();
    state = AsyncValue.data(updatedNotes);
  }
}

final notesProvider = AsyncNotifierProvider<NotesNotifier, List<Note>>(
  NotesNotifier.new,
);
