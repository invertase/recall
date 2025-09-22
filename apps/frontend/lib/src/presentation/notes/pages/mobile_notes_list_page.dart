import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/presentation/notes/widgets/mobile_empty_notes.dart';
import 'package:frontend/src/presentation/notes/widgets/mobile_note_item.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/presentation/notes/widgets/note_menu.dart';
import 'package:frontend/src/providers/auth_provider.dart';
import 'package:frontend/src/providers/theme_provider.dart';
import 'package:frontend/src/providers/notes_provider.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';

class MobileNotesListPage extends ConsumerStatefulWidget {
  const MobileNotesListPage({super.key});

  @override
  ConsumerState<MobileNotesListPage> createState() =>
      _MobileNotesListPageState();
}

class _MobileNotesListPageState extends ConsumerState<MobileNotesListPage> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.day}/${date.month}/${date.year.toString().substring(2)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;
    final notesAsync = ref.watch(notesProvider);

    return CupertinoPageScaffold(
      backgroundColor: colorScheme.background,
      child: Scaffold(
        backgroundColor: colorScheme.background,
        body: NestedScrollView(
          floatHeaderSlivers: false,
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CupertinoSliverNavigationBar(
                alwaysShowMiddle: false,
                leading: AppIcon.recall(size: 40),
                largeTitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppIcon.edit(hasColor: false, size: 26),
                    const SizedBox(width: 8),
                    Text(
                      'My Notes',
                      style: textTheme.heading4?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                middle: Text(
                  'My Notes',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                backgroundColor: colorScheme.background,
                trailing: IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
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
                      topOffset: 44,
                    );
                  },
                ),
              ),
            ];
          },
          body: notesAsync.when(
            data: (notes) {
              if (notes.isEmpty) return MobileEmptyNote();

              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                itemCount: notes.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return MobileNoteItem(
                    title: note.title,
                    date: _formatDate(note.updatedAt),
                    onTap: () {
                      ref.read(selectedNoteProvider.notifier).selectNote(note);
                      context.push('/mobile-note-editor');
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Text(
                'Error loading notes: $error',
                style: textTheme.body?.copyWith(color: colorScheme.error),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ref.read(selectedNoteProvider.notifier).clearSelection();
            context.push('/mobile-note-editor');
          },
          backgroundColor: colorScheme.primary,
          icon: AppIcon.edit(size: 16),
          label: Text(
            'New Note',
            style: textTheme.body?.copyWith(color: AppColors.colourWhite),
          ),
        ),
      ),
    );
  }
}
