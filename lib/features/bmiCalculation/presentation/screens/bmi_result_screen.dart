import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bmi_bloc.dart';
import '../bloc/bmi_state.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<BmiBloc, BmiState>(
            builder: (context, state) {
              if (state.bmiResult != null) {
                return Column(
                  children: [
                    Text("BMI: ${state.bmiResult!.toStringAsFixed(1)}"),
                    Text("Category: ${state.bmiCategory}"),
                  ],
                );
              }
              return Text("Please enter details");
            },
          ),
        ),
      ),
    );
  }
}
