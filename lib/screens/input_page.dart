import 'package:bmi_calculator_app/screens/result_screen.dart';
import 'package:bmi_calculator_app/widgets/child_card.dart';
import 'package:bmi_calculator_app/widgets/custom_button.dart';
import 'package:bmi_calculator_app/widgets/custom_card.dart';
import 'package:bmi_calculator_app/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/height_slider.dart';

enum Gender { male, female }

const primaryColor = Color(0xff101010);
const secondaryColor = Color(0xff1E1E1E);
const buttonColor = Color(0xff7B62FF);
const activeCardColor = Color(0xff7B62FF);
const activeCardColor2 = Color(0xff3240A1);
const inactiveCardColor = Color(0xff1E1E1E);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI Calculator",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    ontap: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    color:
                        gender == Gender.male
                            ? activeCardColor2
                            : inactiveCardColor,
                    childCard: ChildCard(
                      cardText: 'MALE',
                      icon: Foundation.male,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    ontap: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    color:
                        gender == Gender.female
                            ? activeCardColor2
                            : inactiveCardColor,
                    childCard: ChildCard(
                      cardText: 'FEMALE',
                      icon: Foundation.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: secondaryColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Height', style: TextStyle(color: Colors.white)),
                        HeightUnitSwitch(),
                        HeightSliderScreen(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    color: secondaryColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Weight', style: TextStyle(color: Colors.white)),
                       HeightSliderScreen()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            // color: buttonColor,
            color: activeCardColor2,
            buttonText: 'Calculate',
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

//6d63ff
