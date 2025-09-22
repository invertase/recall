import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/landing/pages/landing_page.dart';
import '../../presentation/notes/pages/note_page.dart';
import '../../presentation/notes/pages/mobile_notes_list_page.dart';
import '../../presentation/notes/pages/mobile_note_editor_page.dart';
import '../../providers/auth_provider.dart';

class AppRouter {
  static GoRouter createRouter(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: _AuthNotifier(ref),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const LandingPage();
          },
        ),
        GoRoute(
          path: '/notes',
          builder: (context, state) {
            return const NotePage();
          },
        ),
        GoRoute(
          path: '/mobile-notes-list',
          builder: (context, state) {
            return const MobileNotesListPage();
          },
        ),
        GoRoute(
          path: '/mobile-note-editor',
          builder: (context, state) {
            return const MobileNoteEditorPage();
          },
        ),
      ],
      redirect: (context, state) {
        final authState = ref.watch(authStateProvider);

        if (authState.isLoading) return null;

        final isAuthenticated = authState.value != null;
        final isOnLanding = state.uri.path == '/';

        if (isAuthenticated && isOnLanding) return '/notes';

        if (!isAuthenticated && !isOnLanding) return '/';

        return null;
      },
    );
  }
}

class _AuthNotifier extends ChangeNotifier {
  final WidgetRef _ref;

  _AuthNotifier(this._ref) {
    _ref.listen(authStateProvider, (previous, next) {
      notifyListeners();
    });
  }
}
