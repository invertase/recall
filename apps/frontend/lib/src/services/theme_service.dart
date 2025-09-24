import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_storage/native_storage.dart';

const _themeModeKey = 'themeMode';

final themeServiceProvider = Provider<ThemeService>((ref) {
  final nativeStorage = NativeStorage();
  return ThemeService(nativeStorage);
});

class ThemeService {
  const ThemeService(this._nativeStorage);

  final NativeStorage _nativeStorage;

  ThemeMode getThemeMode() {
    final themeIndexString = _nativeStorage.read(_themeModeKey);
    if (themeIndexString != null) {
      final themeIndex = int.tryParse(themeIndexString);
      if (themeIndex != null && themeIndex < ThemeMode.values.length) {
        return ThemeMode.values[themeIndex];
      }
    }
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode theme) {
    _nativeStorage.write(_themeModeKey, theme.index.toString());
  }
}
