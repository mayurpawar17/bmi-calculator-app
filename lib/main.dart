import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_bloc.dart';
import 'package:bmi_calculator_app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:bmi_calculator_app/features/theme/presentation/bloc/theme_event.dart';
import 'package:bmi_calculator_app/features/theme/presentation/bloc/theme_state.dart';
import 'package:bmi_calculator_app/screens2/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BmiBloc()),
        BlocProvider(create: (_) => ThemeBloc()..add(LoadTheme())),
      ],
      child: const BMICalculator(),
    ),
  );
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AnimatedTheme(
          data: state.themeData,
          duration: const Duration(milliseconds: 200),
          child: MaterialApp(
            theme: state.themeData,

            debugShowCheckedModeBanner: false,
            home: BMICalculatorScreen(),
          ),
        );
      },
    );
  }
}

//
// theme: ThemeData.light().copyWith(
// scaffoldBackgroundColor: primaryColor,
// textTheme: GoogleFonts.openSansTextTheme(),
// )
