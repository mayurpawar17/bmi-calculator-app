import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_bloc.dart';
import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_state.dart';
import 'package:bmi_calculator_app/widgets2/weight_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_cupertino_picker.dart';

class CustomWeightCard extends StatelessWidget {
  CustomWeightCard({super.key});

  final kgList = List.generate(200, (index) => index + 10);
  final lbsList = List.generate(420, (index) => index + 22);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    final width = MediaQuery.of(context).size.width * 0.5;
    return Container(
      padding: EdgeInsets.all(15),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: AppColors.primaryColor2,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.024),
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 5), // Changes position of shadow (x, y)
          ),
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
                            )
                            : CustomCupertinoPicker(
                              valueList: lbsList,
                              unitText: 'Lbs',
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
