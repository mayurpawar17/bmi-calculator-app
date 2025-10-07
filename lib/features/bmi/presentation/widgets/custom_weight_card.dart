import 'package:bmi_calculator_app/features/bmi/presentation/widgets/weight_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/bmi_provider.dart';
import 'custom_cupertino_picker.dart';

class CustomWeightCard extends StatelessWidget {
  CustomWeightCard({super.key});

  final kgList = List.generate(200, (index) => index + 10);

  final int lbsStart = 22; // minimum weight in lbs
  final int lbsCount = 420; // number of items

  final lbsList = List.generate(420, (index) => 22 + index);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    // final width = MediaQuery.of(context).size.width * 0.5;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(15),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow:
            isDark
                ? [
                  // subtle glow in dark mode
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ]
                : [
                  // soft shadow in light mode
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: const Offset(0, 5),
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
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(width: 10),

                WeightSwitch(),
              ],
            ),
            Center(
              child: Consumer<BmiProvider>(
                builder: (context, bmiProvider, child) {
                  return SizedBox(
                    width: 150, // give it a fixed width
                    child:
                        bmiProvider.isKg
                            ? CustomCupertinoPicker(
                              key: const ValueKey('kgPicker'),
                              valueList: kgList,
                              unitText: 'Kg',
                              onSelectedItemChanged: (index) {
                                final kgValue = kgList[index].toDouble();
                                bmiProvider.setWeight(kgValue);
                                bmiProvider.calculateBmi();
                                HapticFeedback.selectionClick();
                              },
                              initialValue: kgList.indexOf(
                                bmiProvider.weightKg.toInt(),
                              ),
                            )
                            : CustomCupertinoPicker(
                              key: const ValueKey('lbsPicker'),
                              valueList: lbsList,
                              unitText: 'Lbs',
                              onSelectedItemChanged: (index) {
                                final lbsValue = lbsList[index].toDouble();
                                bmiProvider.setWeight(lbsValue);
                                bmiProvider.calculateBmi();
                                HapticFeedback.selectionClick();
                              },
                              initialValue: lbsList.indexOf(
                                bmiProvider.lbs.toInt(),
                              ),
                            ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
