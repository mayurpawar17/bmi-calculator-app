import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/bmiGaugeRangeWidget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../provider/bmi_provider.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<BmiProvider>(
                  builder: (context, bmiProvider, child) {
                    return SizedBox(
                      // color: Colors.white,
                      height: 300,

                      child: BMIGaugeRange(
                        bmi: bmiProvider.bmiResult!,
                        gender: bmiProvider.selectedGender!,
                      ),
                    );
                  },
                ),

                Consumer<BmiProvider>(
                  builder: (context, bmiProvider, child) {
                    return Column(
                      children: [
                        Text(
                          "Your BMI: ${bmiProvider.bmiResult?.toStringAsFixed(1) ?? '--'}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          "Category: ${bmiProvider.bmiCategory ?? '--'}",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          "Hint: ${bmiProvider.bmiMsg ?? '--'}",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),

                CustomButton(
                  text: 'Edit Information',
                  onTap: () {
                    HapticFeedback.selectionClick();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
