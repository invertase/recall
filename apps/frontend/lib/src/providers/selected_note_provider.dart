import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/models/edit_note_params.dart';

final selectedNoteProvider =
    NotifierProvider<SelectedNoteNotifier, EditNoteParams>(
      SelectedNoteNotifier.new,
    );

class SelectedNoteNotifier extends Notifier<EditNoteParams> {
  @override
  EditNoteParams build() =>
      const EditNoteParams(id: null, title: '', content: '');

  void selectNote(Note? note) {
    if (note == null) {
      state = EditNoteParams.empty();
      return;
    }

    state = EditNoteParams.fromNote(note);
  }

  void clearSelection() {
    state = EditNoteParams.empty();
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateContent(String content) {
    state = state.copyWith(content: content);
  }
}
