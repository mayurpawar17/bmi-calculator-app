import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const buttonColor = '#7B62FF';
const containerHeight = 80.0;

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.color, this.buttonText, this.ontap});

  final color;
  final buttonText;
  final ontap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    final height = MediaQuery.of(context).size.height * 0.07;
    return GestureDetector(
      onTap: ontap,
      child: Hero(
        tag: 'button',
        child: Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
