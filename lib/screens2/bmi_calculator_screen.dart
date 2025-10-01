import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_bloc.dart';
import 'package:bmi_calculator_app/features/bmiCalculation/presentation/bloc/bmi_state.dart';
import 'package:bmi_calculator_app/features/bmiCalculation/presentation/screens/bmi_result_screen.dart';
import 'package:bmi_calculator_app/widgets2/custom_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/bmiCalculation/presentation/bloc/bmi_event.dart';
import '../features/theme/presentation/bloc/theme_bloc.dart';
import '../features/theme/presentation/bloc/theme_event.dart';
import '../features/theme/presentation/bloc/theme_state.dart';
import '../widgets2/custom_gender_card.dart';
import '../widgets2/custom_height_card.dart';
import '../widgets2/custom_weight_card.dart';

class BMICalculatorScreen extends StatelessWidget {
  BMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return Scaffold(
      // backgroundColor: AppColors.primaryColor2,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI FitIndex Pro",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),

        // backgroundColor: AppColors.primaryColor2,
        elevation: 0.0,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              final value = state.appTheme;
              return IconButton(
                icon: AnimatedCrossFade(
                  firstChild: Icon(Icons.sunny),
                  secondChild: Icon(Icons.dark_mode),
                  crossFadeState:
                      value == AppTheme.dark
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 300),
                ),
                onPressed: () => context.read<ThemeBloc>().add(ToggleTheme()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<BmiBloc, BmiState>(
              builder: (context, state) {
                final bloc = context.read<BmiBloc>();
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //gender section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomGenderCard(
                          onTap: () {
                            bloc.add(GenderSelected(true));
                            HapticFeedback.selectionClick();
                          },
                          isSelected: state.isMale == true,
                          text: 'Male',
                          asset: 'assets/boyIllustration.png',
                        ),

                        CustomGenderCard(
                          isSelected: state.isMale == false,
                          onTap: () {
                            bloc.add(GenderSelected(false));
                            HapticFeedback.selectionClick();
                          },
                          text: 'Female',
                          asset: 'assets/girlIllustration.png',
                        ),
                      ],
                    ),
                    SizedBox(height: 25),

                    //Height section
                    CustomHeightCard(),
                    const SizedBox(height: 25),
                    //Weight section
                    CustomWeightCard(),

                    SizedBox(height: 25),

                    CustomButton2(
                      text: 'Calculate BMI',
                      onTap: () {
                        final bmiBloc = context.read<BmiBloc>();
                        final state = bmiBloc.state;

                        if (state.isMale == null) {
                          // Show snackbar if gender not selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select your gender first'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return; // stop further execution
                        }

                        // Fire the CalculateBMI event if gender is selected
                        bmiBloc.add(CalculateBMI());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BmiResultScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
