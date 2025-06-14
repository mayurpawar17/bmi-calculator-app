import 'package:flutter/material.dart';

import '../screens/input_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, this.categoryText, this.rangeText, required this.color});
  final categoryText;
  final rangeText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: secondaryColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            categoryText,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),

          Text(
            rangeText,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),

          Container(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.1,

            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ],
      ),
    );
  }
}
