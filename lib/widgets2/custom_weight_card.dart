import 'package:bmi_calculator_app/widgets2/weight_switch.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_cupertino_picker.dart';

class CustomWeightCard extends StatelessWidget {
  const CustomWeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    final width = MediaQuery.of(context).size.width * 0.5;
    return Container(
      padding: EdgeInsets.all(15),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor2,

        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.024),
            // Shadow color with some transparency
            spreadRadius: 1,
            // How far the shadow spreads
            blurRadius: 20,
            // How blurry the shadow is
            offset: Offset(0, 5), // Changes position of shadow (x, y)
          ),
          // You can add multiple BoxShadows for more complex effects
          // For example, a very subtle, wider shadow underneath
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Weight',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),

                WeightSwitch(),
              ],
            ),
            CustomCupertinoPicker(),
          ],
        ),
      ),
    );
  }
}
