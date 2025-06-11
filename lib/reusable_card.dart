import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final height;
  final width;
  final color;

  const ReusableCard({super.key, this.height, this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
