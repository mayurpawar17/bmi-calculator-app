import 'package:flutter/material.dart';

extension ThemeBrightnessX on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  bool get isLight => !isDark;
}
