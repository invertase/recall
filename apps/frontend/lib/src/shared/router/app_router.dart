import 'package:flutter/material.dart';
import 'package:frontend/src/presentation/landing/pages/landing_page.dart';
import 'package:frontend/src/presentation/notes/pages/mobile_note_editor_page.dart';
import 'package:frontend/src/presentation/notes/pages/note_page.dart';
import 'package:frontend/src/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRouter {
  static GoRouter createRouter(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: _AuthNotifier(ref),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const LandingPage()),
        GoRoute(
          path: '/notes',
          builder: (context, state) => const NotePage(),
          routes: [
            GoRoute(
              path: 'edit',
              builder: (context, state) {
                return const MobileNoteEditorPage();
              },
            ),
          ],
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
