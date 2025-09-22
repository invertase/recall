import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/shared/theme/theme_data.dart';
import 'package:frontend/src/shared/router/app_router.dart';
import 'package:frontend/src/providers/theme_provider.dart';

void main() {
  usePathUrlStrategy();

  runApp(const ProviderScope(child: RecallApp()));
}

class RecallApp extends ConsumerWidget {
  const RecallApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);
    final router = AppRouter.createRouter(ref);

    return MaterialApp.router(
      title: 'Recall',
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension>[GlobeTheme.light()],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension>[GlobeTheme.dark()],
      ),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
