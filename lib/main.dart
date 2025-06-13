import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:bmi_calculator_app/screens/result_screen.dart';
import 'package:bmi_calculator_app/widgets/bmi_gauge_range.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

const primaryColor = '#101010';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: HexColor(primaryColor),
        textTheme: GoogleFonts.montserratTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
