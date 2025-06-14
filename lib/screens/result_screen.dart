import 'package:bmi_calculator_app/widgets/bmi_gauge_range.dart';
import 'package:bmi_calculator_app/widgets/category_card.dart';
import 'package:bmi_calculator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'input_page.dart';



class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi, required this.gender});

  final double bmi;
  final Gender? gender;

  String _yourCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
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
        title: Text('Your result', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),

        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: 'range',
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
                      text:
                          ' ${_yourCategory(double.parse(bmi.toStringAsFixed(1)))}',
                      style: GoogleFonts.montserrat(
                        color: _getBMIColor(
                          double.parse(bmi.toStringAsFixed(1)),
                        ),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                spacing: 10,
                children: [
                  CategoryCard(
                    categoryText: 'Underweight',
                    rangeText: 'Below 18.5',
                    color: Colors.yellow,
                  ),
                  CategoryCard(
                    categoryText: 'Normal         ',
                    rangeText: '18.5 to 24.9',
                    color: Colors.green,
                  ),
                  CategoryCard(
                    categoryText: 'Overweight',
                    rangeText: '24.9 to 29.9',
                    color: Colors.orange,
                  ),
                  CategoryCard(
                    categoryText: 'Obesity      ',
                    rangeText: '30 or greater',
                    color: Colors.red,
                  ),
                ],
              ),
              CustomButton(
                buttonText: 'Edit Information',
                color: activeCardColor2,
                ontap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
