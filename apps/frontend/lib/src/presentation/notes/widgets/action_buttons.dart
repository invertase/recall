import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/experimental/mutation.dart';
import 'package:frontend/src/shared/widgets/action_button.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';
import 'package:frontend/src/providers/note_mutations.dart';
import 'package:frontend/src/shared/utils/snackbar_utils.dart';
import 'package:frontend/src/shared/utils/note_validation.dart';

class ActionButtons extends ConsumerWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNote = ref.watch(selectedNoteProvider);
    final isNewNote = selectedNote.id == null;

    final saveState = ref.watch(saveNote);
    final deleteState = ref.watch(deleteNote);

    ref.listen<MutationState<dynamic>>(saveNote, (previous, next) {
      switch (next) {
        case MutationSuccess():
          final isNewNote = selectedNote.id == null;
          final message = isNewNote
              ? 'Note created successfully!'
              : 'Note updated successfully!';
          SnackbarUtils.showSuccess(context, message);
        case MutationError():
          String message;
          if (next.error is NoteValidationException) {
            message = (next.error as NoteValidationException).message;
          } else {
            message = 'Failed to save note: ${next.error.toString()}';
          }
          SnackbarUtils.showError(context, message);
        case MutationPending():
        case MutationIdle():
          break;
      }
    });

    ref.listen<MutationState<void>>(deleteNote, (previous, next) {
      switch (next) {
        case MutationSuccess():
          SnackbarUtils.showSuccess(context, 'Note deleted successfully!');
        case MutationError():
          SnackbarUtils.showError(
            context,
            'Failed to delete note: ${next.error.toString()}',
          );
        case MutationPending():
        case MutationIdle():
          break;
      }
    });

    return Row(
      children: [
        ActionButton(
          text: saveState.isPending ? 'Saving...' : 'Save',
          icon: AppIcon.save(),
          onPressed: switch (saveState) {
            MutationPending() => null,
            _ => () => executeSaveNote(ref),
          },
        ),
        const SizedBox(width: 12),
        if (!isNewNote)
          ActionButton(
            text: 'Delete',
            icon: AppIcon.delete(),
            onPressed: switch (deleteState) {
              MutationPending() => null,
              _ => () => executeDeleteNote(ref, selectedNote.id!),
            },
            isDestructive: true,
          ),
      ],
    );
  }
}
