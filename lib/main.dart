import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith( scaffoldBackgroundColor: HexColor('#F4F3FF'),),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
