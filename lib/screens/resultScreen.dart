import 'package:bmi_calculator_app/widgets/bmiGaugeRangeWidget.dart';
import 'package:bmi_calculator_app/widgets/categoryCardWidget.dart';
import 'package:bmi_calculator_app/widgets/customButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'inputScreen.dart';

const Color primaryColor = Color(0xff101010);
const Color activeCardColor2 = Color(0xff3240A1);

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi, required this.gender});

  final double bmi;
  final Gender gender; // Changed to non-nullable if possible

  String _yourCategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 24.9) return 'Normal';
    if (bmi < 29.9) return 'Overweight';
    return 'Obesity';
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) return Colors.yellow;
    if (bmi < 24.9) return Colors.green;
    if (bmi < 29.9) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text('Your result', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'range_$bmi', // Unique tag
              child: BMIGaugeRange(bmi: bmi, gender: gender),
            ),
            RichText(
              text: TextSpan(
                text: 'Your BMI is ',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 22,
                ),
                children: [
                  TextSpan(
                    text: ' ${_yourCategory(bmi)}',
                    style: GoogleFonts.montserrat(
                      color: _getBMIColor(bmi),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                CategoryCard(
                  categoryText: 'Underweight',
                  rangeText: 'Below 18.5',
                  color: Colors.yellow,
                ),
                const SizedBox(height: 10),
                CategoryCard(
                  categoryText: 'Normal',
                  rangeText: '18.5 to 24.9',
                  color: Colors.green,
                ),
                const SizedBox(height: 10),
                CategoryCard(
                  categoryText: 'Overweight',
                  rangeText: '24.9 to 29.9',
                  color: Colors.orange,
                ),
                const SizedBox(height: 10),
                CategoryCard(
                  categoryText: 'Obesity',
                  rangeText: '30 or greater',
                  color: Colors.red,
                ),
              ],
            ),
            CustomButton(
              buttonText: 'Edit Information',
              color: activeCardColor2,
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
