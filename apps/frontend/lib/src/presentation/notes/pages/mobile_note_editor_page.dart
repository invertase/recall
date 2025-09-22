import 'package:flutter/material.dart';
import 'package:frontend/src/presentation/notes/widgets/mobile_note_text_editor.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/action_button.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/shared/widgets/recall_logo.dart';
import 'package:frontend/src/presentation/notes/widgets/note_menu.dart';
import 'package:frontend/src/presentation/notes/widgets/title_section.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';
import 'package:frontend/src/providers/note_mutations.dart';
import 'package:frontend/src/providers/auth_provider.dart';
import 'package:frontend/src/providers/theme_provider.dart';
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

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const RecallLogo(),
        actions: [
          IconButton(
            icon: AppIcon.burgerMenu(size: 16),
            onPressed: () {
              NoteMenu.show(
                context,
                onThemeToggle: ref
                    .read(themeModeNotifierProvider.notifier)
                    .toggle,
                onSignOut: () async {
                  await ref.read(authStateProvider.notifier).signOut();
                },
                topOffset: kToolbarHeight,
              );
            },
          ),
        ],
      ),
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
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ActionButton(
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
                if (!isNewNote) ...[
                  const SizedBox(height: 12),
                  ActionButton(
                    text: 'Delete Note',
                    icon: AppIcon.delete(),
                    onPressed: deleteState is MutationPending
                        ? null
                        : () async {
                            await executeDeleteNote(ref, selectedNote.id!);
                            if (context.mounted) {
                              context.pop();
                            }
                          },
                    isDestructive: true,
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
