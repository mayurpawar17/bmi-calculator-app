import 'package:bmi_calculator_app/widgets/bmi_gauge_range.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: 'range',
            child: BMIGaugeRange(bmi: 24)),
      ),
    );
  }
}
