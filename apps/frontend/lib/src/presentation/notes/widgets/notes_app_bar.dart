import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/presentation/notes/widgets/note_menu.dart';
import 'package:frontend/src/providers/auth_provider.dart';
import 'package:frontend/src/providers/theme_provider.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/widgets/app_icon.dart';
import 'package:frontend/src/shared/widgets/recall_logo.dart';

class NotesAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const NotesAppBar({super.key, this.showBottom = true});

  final bool showBottom;

  @override
  Size get preferredSize => Size.fromHeight(showBottom ? 136 : 72);

  @override
  ConsumerState<NotesAppBar> createState() => _NotesAppBarState();
}

class _NotesAppBarState extends ConsumerState<NotesAppBar> {
  late final ValueNotifier<bool> _isMenuOpen = ValueNotifier(false);

  @override
  void dispose() {
    _isMenuOpen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = GlobeTheme.of(context).colorScheme;
    final textTheme = GlobeTheme.of(context).textTheme;

    final canPop = ModalRoute.canPopOf(context) ?? false;

    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: canPop ? 8 : 24),
        child: Row(children: [if (canPop) BackButton(), RecallLogo()]),
      ),
      leadingWidth: canPop ? 140 : 124,
      toolbarHeight: 72,
      backgroundColor: colorScheme.background,
      actions: [
        ValueListenableBuilder(
          valueListenable: _isMenuOpen,
          builder: (context, value, child) {
            return AnimatedIconButton(
              onPressed: () async {
                _isMenuOpen.value = true;

                await NoteMenu.show(
                  context,
                  onThemeToggle: ref
                      .read(themeModeNotifierProvider.notifier)
                      .toggle,
                  onSignOut: () async {
                    await ref.read(authStateProvider.notifier).signOut();
                  },
                  topOffset: 72,
                );

                _isMenuOpen.value = false;
              },
              isOpen: value,
            );
          },
        ),
        SizedBox(width: 24),
      ],
      bottom: widget.showBottom
          ? PreferredSize(
              preferredSize: Size.fromHeight(64),
              child: Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: Row(
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
              ),
            )
          : null,
    );
  }
}

class AnimatedIconButton extends StatelessWidget {
  const AnimatedIconButton({
    super.key,
    required this.onPressed,
    required this.isOpen,
  });

  final VoidCallback onPressed;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: EdgeInsets.zero,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: !isOpen ? AppIcon.burgerMenu(size: 16) : Icon(Icons.close),
      ),
      onPressed: onPressed,
    );
  }
}
