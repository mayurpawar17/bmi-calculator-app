import 'package:bmi_calculator_app/widgets/bmi_gauge_range.dart';
import 'package:flutter/material.dart';


const primaryColor = Color(0xff101010);
const secondaryColor = Color(0xff1E1E1E);

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your result',style: TextStyle(color: Colors.white),), leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),

        backgroundColor: primaryColor,),
      body: Center(
        child: Hero(
            tag: 'range',
            child: BMIGaugeRange(bmi: 24)),
      ),
    );
  }
}
