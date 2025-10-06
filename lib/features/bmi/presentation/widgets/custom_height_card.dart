import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/bmi_provider.dart';
import 'custom_cupertino_picker.dart';
import 'custom_slider.dart';
import 'height_switch.dart';

class CustomHeightCard extends StatelessWidget {
  CustomHeightCard({super.key});

  final feetList = List.generate(6, (index) => index + 3); // 3–8 ft
  final inchList = List.generate(12, (index) => index); // 0–11 inch

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(15),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title + switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Height',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              const HeightSwitch(),
            ],
          ),

          // Height input (cm or ft/in)
          Consumer<BmiProvider>(
            builder: (context, bmiProvider, child) {
              return Expanded(
                child: bmiProvider.isCm
                    ? CustomSlider(
                        value: bmiProvider.heightCm,
                        onChanged: (newHeight) {
                          bmiProvider.setHeight(newHeight);
                          bmiProvider.calculateBmi();
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomCupertinoPicker(
                            valueList: feetList,
                            unitText: 'Ft',
                            onSelectedItemChanged: (index) {
                              final newFeet = feetList[index].toDouble();
                              bmiProvider.setFeet(newFeet);
                              bmiProvider.calculateBmi();
                              HapticFeedback.selectionClick();
                            },
                          ),
                          CustomCupertinoPicker(
                            valueList: inchList,
                            unitText: 'Inch',
                            onSelectedItemChanged: (index) {
                              final newInches = inchList[index].toDouble();
                              bmiProvider.setInches(newInches);
                              bmiProvider.calculateBmi();
                              HapticFeedback.selectionClick();
                            },
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
