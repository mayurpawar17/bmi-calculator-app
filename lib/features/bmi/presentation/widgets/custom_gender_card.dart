import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

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

    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // color: AppColors.primaryColor2,
          color: isDark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.accentBlueDarkColor
                : Colors.transparent,
            width: 2.5,
          ),

          boxShadow: isDark
              ? [
                  // subtle glow in dark mode
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ]
              : [
                  // normal shadow in light mode
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset(asset, height: 100),
          ],
        ),
      ),
    );
  }
}
