import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.iconData,
    required this.text,
    required this.widget,
    this.color,
  });
  final IconData iconData;
  final String text;
  final Widget widget;
  final color;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.06;
    final width = MediaQuery.of(context).size.width * 0.42;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(
              0.1,
            ), // Shadow color with some transparency
            spreadRadius: 1, // How far the shadow spreads
            blurRadius: 1, // How blurry the shadow is
            offset: Offset(0, 2 / 2), // Offset of the shadow (x, y)
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(iconData),
              SizedBox(width: 20),
              Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          widget,
        ],
      ),
    );
  }
}
