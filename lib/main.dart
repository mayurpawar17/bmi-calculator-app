import 'package:bmi_calculator_app/bloc/bmi_bloc.dart';
import 'package:bmi_calculator_app/screens/inputScreen.dart';
import 'package:bmi_calculator_app/screens2/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BmiBloc(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: primaryColor,
          textTheme: GoogleFonts.openSansTextTheme(),
        ),

        debugShowCheckedModeBanner: false,
        home: BMICalculatorScreen(),
      ),
    );
  }
}
