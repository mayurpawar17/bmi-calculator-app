import 'package:bmi_calculator_app/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

const bottomContainerHeight=80.0;

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
        title: Center(child: Text("BMI Calculator")),
        backgroundColor: HexColor('#F4F3FF'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: HexColor('#6d63ff'))),
                Expanded(child: ReusableCard(color: HexColor('#6d63ff'))),
              ],
            ),
          ),
          Expanded(child: ReusableCard(color: HexColor('#6d63ff'))),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(color: HexColor('#6d63ff'))),
                Expanded(child: ReusableCard(color: HexColor('#6d63ff'))),
              ],
            ),
          ),
          Container(
            color: Colors.deepPurple,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height:bottomContainerHeight  ,
          ),
        ],
      ),
    );
  }
}

//6d63ff
