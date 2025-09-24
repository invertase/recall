import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/shared/extensions/responsivex.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/presentation/notes/widgets/desktop_note_content.dart';
import 'package:frontend/src/presentation/notes/pages/mobile_notes_list_page.dart';
import 'package:frontend/src/providers/theme_provider.dart';

class NotePage extends ConsumerWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final themeToggle = ref.read(themeModeNotifierProvider.notifier).toggle;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: context.isMobile
            ? const MobileNotesListPage()
            : DesktopNoteContent(onThemeToggle: themeToggle),
      ),
    );
  }
}
