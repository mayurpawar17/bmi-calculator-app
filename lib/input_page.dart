import 'package:bmi_calculator_app/widgets/child_card.dart';
import 'package:bmi_calculator_app/widgets/custom_button.dart';
import 'package:bmi_calculator_app/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:hexcolor/hexcolor.dart';

const primaryColor = '#101010';
const secondaryColor = '#3D3D3D';
const buttonColor = '#7B62FF';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: HexColor(primaryColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: HexColor(secondaryColor),
                    childCard: ChildCard(cardText: 'MALE', icon: Ionicons.male),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: HexColor(secondaryColor),
                    childCard: ChildCard(
                      cardText: 'FEMALE',
                      icon: Ionicons.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: ReusableCard(color: HexColor(secondaryColor))),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: HexColor(secondaryColor))),
                // Expanded(child: ReusableCard(color: HexColor(secondaryColor))),
              ],
            ),
          ),
          CustomButton(color: HexColor(buttonColor), buttonText: 'Calculate'),
        ],
      ),
    );
  }
}

//6d63ff
