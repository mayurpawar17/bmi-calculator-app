import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomGenderCard extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String asset;

  final bool isSelected;

  const CustomGenderCard({
    super.key,

    required this.onTap,
    required this.text,
    required this.isSelected,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.17;
    final width = MediaQuery.of(context).size.width * 0.42;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // color: AppColors.primaryColor2,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isSelected ? AppColors.accentBlueDarkColor : Colors.transparent,
            width: 2.5,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.024),
              spreadRadius: 1,
              blurRadius: 20,
              offset: Offset(0, 5), // Changes position of shadow (x, y)
            ),

            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 5,
              blurRadius: 25,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(text), Image.asset(asset, height: 100)],
        ),
      ),
    );
  }
}
