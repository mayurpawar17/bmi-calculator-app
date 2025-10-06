// lib/theme/theme_service.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const _themeModeKey = 'themeMode';

  // Load the ThemeMode from SharedPreferences
  Future<ThemeMode> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    // Read the stored index, defaulting to 0 (system) if not found.
    final themeIndex = prefs.getInt(_themeModeKey) ?? 0;
    return ThemeMode.values[themeIndex];
  }

  // Save the ThemeMode to SharedPreferences
  Future<void> saveTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, themeMode.index);
  }
}
