import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class AppThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightPrimaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.lightPrimaryColor, foregroundColor: Colors.black, elevation: 0, centerTitle: true, surfaceTintColor: Colors.transparent),
    fontFamily: 'OpenSans',
    pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: SharedAxisPageTransitionsBuilder(transitionType: SharedAxisTransitionType.horizontal, fillColor: Colors.white)}),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkPrimaryColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkPrimaryColor, foregroundColor: Colors.white, elevation: 0, centerTitle: true, surfaceTintColor: Colors.transparent),
    fontFamily: 'OpenSans',
    pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: SharedAxisPageTransitionsBuilder(transitionType: SharedAxisTransitionType.horizontal, fillColor: Colors.black)}),
  );
}
