import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff101010);
const secondaryColor = Color(0xff1E1E1E);
const accentBlueDarkColor = Color(0xff3240A1);
const inactiveCardColor = Color(0xff1E1E1E);

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xffF4F6F8),
    colorScheme: ColorScheme.light(
      primary: Color(0xff3240A1),
      secondary: Color(0xffffffff),
      tertiary: Color(0xff000000),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor:Color(0xffF4F6F8) ,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xff101010),
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey.shade800,
      secondary: Colors.blueGrey.shade600,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey.shade800,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: GoogleFonts.montserratTextTheme(),
  );
}
