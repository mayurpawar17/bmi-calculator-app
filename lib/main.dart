import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'input_page.dart';

const primaryColor = '#101010';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: HexColor(primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}
