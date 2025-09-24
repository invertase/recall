import 'package:flutter/material.dart';
import 'package:frontend/src/presentation/notes/widgets/delete_confirmation_dialog.dart';
import 'package:frontend/src/presentation/notes/widgets/mobile_note_text_editor.dart';
import 'package:frontend/src/presentation/notes/widgets/notes_app_bar.dart';
import 'package:frontend/src/shared/widgets/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/presentation/notes/widgets/title_section.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';
import 'package:frontend/src/providers/note_mutations.dart';
import 'package:frontend/src/shared/utils/snackbar_utils.dart';
import 'package:frontend/src/shared/utils/note_validation.dart';
import 'package:riverpod/experimental/mutation.dart';

class MobileNoteEditorPage extends ConsumerStatefulWidget {
  const MobileNoteEditorPage({super.key});

  @override
  ConsumerState<MobileNoteEditorPage> createState() =>
      _MobileNoteEditorPageState();
}

class _MobileNoteEditorPageState extends ConsumerState<MobileNoteEditorPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedNote = ref.read(selectedNoteProvider);
      if (selectedNote.id == null) {
        ref.read(selectedNoteProvider.notifier).clearSelection();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final selectedNote = ref.watch(selectedNoteProvider);
    final isNewNote = selectedNote.id == null;
    final saveState = ref.watch(saveNote);
    final deleteState = ref.watch(deleteNote);

    ref.listen<MutationState<dynamic>>(saveNote, (previous, next) {
      switch (next) {
        case MutationSuccess():
          SnackbarUtils.showSuccess(context, 'Note saved successfully');
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

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: NotesAppBar(showBottom: false),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TitleSection(
            currentTitle: selectedNote.title,
            onTitleChanged: (title) {
              ref.read(selectedNoteProvider.notifier).updateTitle(title);
            },
          ),
          const SizedBox(height: 24),
          MobileNoteTextEditor(
            key: ValueKey(selectedNote.id),
            currentContent: selectedNote.content,
            onContentChanged: (content) {
              ref.read(selectedNoteProvider.notifier).updateContent(content);
            },
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Save',
                    icon: AppIcon.save(),
                    onPressed: saveState is MutationPending
                        ? null
                        : () async {
                            await executeSaveNote(ref);
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                  ),
                ),
                if (!isNewNote) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      text: 'Delete Note',
                      icon: AppIcon.delete(),
                      // onPressed: deleteState is MutationPending
                      //     ? null
                      //     : () async {
                      //         await executeDeleteNote(ref, selectedNote.id!);
                      //         if (context.mounted) {
                      //           context.pop();
                      //         }
                      //       },
                      onPressed: deleteState is MutationPending
                          ? null
                          : () => DeleteConfirmationDialog.show(
                              context,
                              onDeleteClicked: switch (deleteState) {
                                MutationPending() => null,
                                _ => () => executeDeleteNote(
                                  ref,
                                  selectedNote.id!,
                                ),
                              },
                            ),
                      isDestructive: true,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
