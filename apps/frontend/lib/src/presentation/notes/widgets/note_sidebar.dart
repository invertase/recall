import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/shared/widgets/recall_logo.dart';
import 'package:frontend/src/presentation/notes/widgets/large_button.dart';
import 'package:frontend/src/presentation/notes/widgets/my_notes_section.dart';
import 'package:frontend/src/providers/selected_note_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteSidebar extends ConsumerWidget {
  const NoteSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = GlobeTheme.of(context).colorScheme;

    return Container(
      width: 238,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: colorScheme.outline, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RecallLogo(),
          const SizedBox(height: 48),
          LargeButton.primary(
            text: 'New Note',
            icon: AppIcon.edit(),
            onPressed: () => _createNewNote(ref),
          ),
          const SizedBox(height: 48),
          const MyNotesSection(),
          LargeButton(
            text: 'Go to Repository',
            icon: AppIcon.link(),
            onPressed: () => _launchUrl('https://github.com/invertase/recall'),
          ),
          const SizedBox(height: 12),
          LargeButton(
            text: 'Terms and Privacy',
            icon: AppIcon.link(),
            onPressed: () => _launchUrl(
              'https://github.com/invertase/recall/blob/main/TERMS_OF_SERVICE.md',
            ),
          ),
        ],
      ),
    );
  }

  void _createNewNote(WidgetRef ref) {
    ref.read(selectedNoteProvider.notifier).selectNote(null);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
