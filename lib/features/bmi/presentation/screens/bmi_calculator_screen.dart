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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "BMI FitIndex Pro",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: AnimatedCrossFade(
                  firstChild: Icon(Icons.sunny),
                  secondChild: Icon(Icons.dark_mode),
                  crossFadeState:
                      isDark
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 300),
                ),
                onPressed: () {
                  themeProvider.toggleTheme(isDark);
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
                    text: 'Calculate BMI',
                    onTap: () {
                      HapticFeedback.selectionClick();
                      if (bmiProvider.selectedGender != null) {
                        bmiProvider.calculateBmi();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BmiResultScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select Gender!!!')),
                        );
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
