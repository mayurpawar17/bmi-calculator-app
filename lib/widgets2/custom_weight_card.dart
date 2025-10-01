import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_bloc.dart';
import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_state.dart';
import 'package:bmi_calculator_app/widgets2/weight_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/bmiCalculation/presentation/bloc/bmi_event.dart';
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
    final width = MediaQuery.of(context).size.width * 0.5;

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
                Text('Weight', style: TextStyle(fontWeight: FontWeight.w700)),

                WeightSwitch(),
              ],
            ),
            BlocBuilder<BmiBloc, BmiState>(
              builder: (context, state) {
                return Center(
                  child: SizedBox(
                    width: 150, // give it a fixed width
                    child:
                        state.isKg
                            ? CustomCupertinoPicker(
                              valueList: kgList,
                              unitText: 'Kg',

                              onSelectedItemChanged: (kgValue) {
                                final actualKg = kgList[kgValue];
                                context.read<BmiBloc>().add(
                                  WeightChangedKg(actualKg.toDouble()),
                                );
                                print(actualKg);
                              },
                            )
                            : CustomCupertinoPicker(
                              valueList: lbsList,
                              unitText: 'Lbs',
                              onSelectedItemChanged: (lbsValue) {
                                final actualLbs = lbsList[lbsValue];
                                context.read<BmiBloc>().add(
                                  WeightChangedLbs(actualLbs.toDouble()),
                                );
                              },
                            ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
