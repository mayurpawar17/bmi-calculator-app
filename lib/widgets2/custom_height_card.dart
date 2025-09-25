import 'package:bmi_calculator_app/widgets2/custom_cupertino_picker.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'height_switch.dart';

class CustomHeightCard extends StatelessWidget {
  const CustomHeightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.28;

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
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 5),
          ),

          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Height',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(width: 10),
              HeightSwitch(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [CustomCupertinoPicker(), CustomCupertinoPicker()],
          ),

          Text(
            '5 feet 3 inches (160 cm)',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
