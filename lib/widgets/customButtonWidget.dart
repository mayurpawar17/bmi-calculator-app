// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// const buttonColor = '#7B62FF';
// const containerHeight = 80.0;
//
// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key, this.color, this.buttonText, this.ontap});
//
//   final color;
//   final buttonText;
//   final ontap;
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width * 0.5;
//     final height = MediaQuery.of(context).size.height * 0.06;
//     final bottom = MediaQuery.of(context).size.height * 0.02;
//     return GestureDetector(
//       onTap: ontap,
//       child: Hero(
//         tag: 'button',
//         child: Container(
//           margin: EdgeInsets.only(bottom: bottom),
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(40.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 buttonText,
//                 style: GoogleFonts.montserrat(
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kButtonColor = Color(0xFF7B62FF); // Convert hex to Flutter Color
const double kContainerHeight = 80.0;
const double kButtonWidthFactor = 0.5; // Instead of hardcoding 0.5
const double kButtonHeightFactor = 0.06;
const double kBottomMarginFactor = 0.02;
const double kBorderRadius = 40.0;
const double kFontSize = 18.0;

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = kButtonColor,
    required this.buttonText,
    required this.onTap,
    this.heroTag,
  });

  final Color color;
  final String buttonText;
  final VoidCallback onTap;
  final String? heroTag; // Optional unique Hero tag

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * kButtonWidthFactor;
    final height = MediaQuery.of(context).size.height * kButtonHeightFactor;
    final bottomMargin =
        MediaQuery.of(context).size.height * kBottomMarginFactor;

    Widget buttonContent = Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      width: width,
      height: height,
      alignment: Alignment.center,
      // Center text directly
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Text(
        buttonText,
        style: GoogleFonts.montserrat(
          fontSize: kFontSize,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    return heroTag != null
        ? Hero(
          tag: heroTag!, // Use provided tag or skip Hero entirely
          child: buttonContent,
        )
        : GestureDetector(onTap: onTap, child: buttonContent);
  }
}
