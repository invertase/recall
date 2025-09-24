import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/presentation/notes/widgets/mobile_empty_notes.dart';
import 'package:frontend/src/presentation/notes/widgets/mobile_note_item.dart';
import 'package:frontend/src/presentation/notes/widgets/notes_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/src/shared/theme/app_colors.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/providers/notes_provider.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class MobileNotesListPage extends ConsumerStatefulWidget {
  const MobileNotesListPage({super.key});

  @override
  ConsumerState<MobileNotesListPage> createState() =>
      _MobileNotesListPageState();
}

class _MobileNotesListPageState extends ConsumerState<MobileNotesListPage> {
  late final ScrollController _scrollController = ScrollController();
  late final ValueNotifier<bool> _isMenuOpen = ValueNotifier(false);

  @override
  void dispose() {
    _scrollController.dispose();
    _isMenuOpen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;
    final notesAsync = ref.watch(notesProvider);

    return CupertinoPageScaffold(
      backgroundColor: colorScheme.background,
      child: Scaffold(
        appBar: NotesAppBar(),
        backgroundColor: colorScheme.background,
        body: notesAsync.when(
          data: (notes) {
            if (notes.isEmpty) return MobileEmptyNote();

            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemCount: notes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final note = notes[index];
                return MobileNoteItem(
                  title: note.title,
                  date: timeago.format(note.updatedAt),
                  onTap: () {
                    ref.read(selectedNoteProvider.notifier).selectNote(note);
                    context.go('/notes/edit');
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            ref.read(selectedNoteProvider.notifier).clearSelection();
            context.go('/notes/edit');
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
