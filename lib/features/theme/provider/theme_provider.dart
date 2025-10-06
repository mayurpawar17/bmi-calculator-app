// lib/theme/theme_provider.dart

import 'package:flutter/material.dart';

import '../data/theme_service.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeService _themeService = ThemeService();

  // A private variable to hold the theme state.
  late ThemeMode _themeMode;

  // A public getter for the theme state.
  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    // Set a default theme and then load the saved preference.
    _themeMode = ThemeMode.system; // Default value
    _loadTheme();
  }

  void toggleTheme(bool isCurrentlyDark) {
    setTheme(isCurrentlyDark ? ThemeMode.light : ThemeMode.dark);
  }

  // Load the saved theme from SharedPreferences
  void _loadTheme() async {
    _themeMode = await _themeService.loadTheme();
    // Notify listeners to rebuild the UI with the loaded theme.
    notifyListeners();
  }

  // Method to update and save the theme
  void setTheme(ThemeMode themeMode) {
    // Don't do anything if the theme is already the same.
    if (_themeMode == themeMode) return;

    _themeMode = themeMode;
    // Save the new theme preference to the device.
    _themeService.saveTheme(themeMode);
    // Notify listeners about the change.
    notifyListeners();
  }
}
