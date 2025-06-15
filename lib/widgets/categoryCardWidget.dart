import 'package:flutter/material.dart';

// Colors
const primaryColor = Color(0xff101010);
const secondaryColor = Color(0xff1E1E1E);
const accentBlueDarkColor = Color(0xff3240A1);
const inactiveCardColor = Color(0xff1E1E1E);

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryText,
    required this.rangeText,
    required this.color,
  });

  final String categoryText;
  final String rangeText;
  final Color color;

  // Constants
  static const double _cardHeightFactor = 0.04;
  static const double _colorIndicatorWidthFactor = 0.1;
  static const double _borderRadius = 4;
  static const double _colorIndicatorRadius = 9;
  static const double _fontSize = 18;
  static const double _colorIndicatorHeight = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * _cardHeightFactor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            categoryText,
            style: const TextStyle(color: Colors.white, fontSize: _fontSize),
          ),
          Text(
            rangeText,
            style: const TextStyle(color: Colors.white, fontSize: _fontSize),
          ),
          Container(
            height: _colorIndicatorHeight,
            width:
                MediaQuery.of(context).size.width * _colorIndicatorWidthFactor,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(_colorIndicatorRadius),
            ),
          ),
        ],
      ),
    );
  }
}
