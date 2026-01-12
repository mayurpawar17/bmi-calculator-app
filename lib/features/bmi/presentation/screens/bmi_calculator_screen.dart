import 'package:bmi_calculator_app/core/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../theme/provider/theme_provider.dart';
import '../../provider/bmi_provider.dart';
import '../widgets/custom_gender_card.dart';
import '../widgets/custom_height_card.dart';
import '../widgets/custom_weight_card.dart';
import 'bmi_result_screen.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI FitIndex Pro", style: TextStyle(fontWeight: FontWeight.w600)),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: AnimatedCrossFade(
                  firstChild: Icon(Icons.dark_mode),
                  secondChild: Icon(Icons.sunny),
                  crossFadeState: context.isDark ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 300),
                ),
                onPressed: () {
                  themeProvider.toggleTheme(context.isDark);
                  HapticFeedback.selectionClick();
                },
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              //gender section
              Consumer<BmiProvider>(
                builder: (context, bmiProvider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomGenderCard(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          bmiProvider.genderSelection(Gender.male);
                        },
                        isSelected: bmiProvider.selectedGender == Gender.male,
                        text: 'Male',
                        asset: 'assets/boyIllustration.png',
                      ),

                      CustomGenderCard(
                        isSelected: bmiProvider.selectedGender == Gender.female,
                        onTap: () {
                          HapticFeedback.selectionClick();
                          bmiProvider.genderSelection(Gender.female);
                        },
                        text: 'Female',
                        asset: 'assets/girlIllustration.png',
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 25),

              //Height section
              CustomHeightCard(),
              const SizedBox(height: 25),
              //Weight section
              CustomWeightCard(),

              const SizedBox(height: 25),

              Consumer<BmiProvider>(
                builder: (context, bmiProvider, child) {
                  return CustomButton(
                    title: 'Calculate BMI',
                    onPressed: () {
                      HapticFeedback.selectionClick();
                      if (bmiProvider.selectedGender != null) {
                        bmiProvider.calculateBmi();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResultScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select Gender!!!')));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
