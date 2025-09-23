import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:common/common.dart';
import 'package:frontend/src/services/auth_service.dart';
import 'package:frontend/src/services/user_service.dart';

final authStateProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final authService = ref.read(authServiceProvider);
    final userService = ref.watch(userServiceProvider);

    final token = authService.getToken();

    if (token == null) return null;

    return await userService.getMyProfile();
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    final authService = ref.read(authServiceProvider);
    await authService.signInWithGoogle();
  }

  Future<void> signInWithGitHub() async {
    state = const AsyncValue.loading();
    final authService = ref.read(authServiceProvider);
    await authService.signInWithGitHub();
  }

  Future<void> handleAuthCallback(String token) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authService = ref.read(authServiceProvider);
      final userService = ref.watch(userServiceProvider);

      authService.saveToken(token);
      return await userService.getMyProfile();
    });
  }

  Future<void> processOAuthCallback(String? token, String? error) async {
    if (error != null) {
      state = AsyncValue.error(
        'Sign-in failed: ${Uri.decodeComponent(error)}',
        StackTrace.current,
      );
      return;
    }
    if (token != null) {
      await handleAuthCallback(token);
    }
  }

  Future<void> signOut() async {
    final authService = ref.read(authServiceProvider);
    authService.signOut();
    state = const AsyncValue.data(null);
  }
}
