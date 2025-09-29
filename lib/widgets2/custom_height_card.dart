import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_bloc.dart';
import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_state.dart';
import 'package:bmi_calculator_app/widgets2/custom_cupertino_picker.dart';
import 'package:bmi_calculator_app/widgets2/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'height_switch.dart';

class CustomHeightCard extends StatelessWidget {
  CustomHeightCard({super.key});

  final feetList = List.generate(6, (index) => index + 3);
  final inchList = List.generate(12, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.28;

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
              Text('Height', style: TextStyle(fontWeight: FontWeight.w700)),
              SizedBox(width: 10),
              HeightSwitch(),
            ],
          ),
          BlocBuilder<BmiBloc, BmiState>(
            builder: (context, state) {
              return state.isCm
                  ? CustomSlider(value: 150, onChanged: (v) {})
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      CustomCupertinoPicker(
                        valueList: feetList,
                        unitText: 'Ft',
                      ),
                      CustomCupertinoPicker(
                        valueList: inchList,
                        unitText: 'Inch',
                      ),
                    ],
                  );
            },
          ),

          Text('5 feet 3 inches (160 cm)'),
        ],
      ),
    );
  }
}
