import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/services/theme_service.dart';

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ref.watch(themeServiceProvider).getThemeMode();
  }

  void _setTheme(ThemeMode theme) {
    ref.read(themeServiceProvider).setThemeMode(theme);
    state = theme;
  }

  void toggle() {
    final newTheme = state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    _setTheme(newTheme);
  }

  void set(ThemeMode theme) {
    _setTheme(theme);
  }
}

final themeModeNotifierProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);
