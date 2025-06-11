import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    this.height,
    this.width,
    required this.color,
    this.childCard,
  });

  final height;
  final width;
  final color;
  final childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
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
