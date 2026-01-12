import 'package:bmi_calculator_app/core/utils/helper_methods.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class BmiSectionCard extends StatelessWidget {
  const BmiSectionCard({super.key, required this.title, required this.switchWidget, required this.child});

  final String title;
  final Widget switchWidget;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;

    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: context.isDark ? AppColors.darkSecondaryColor : AppColors.lightSecondaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: context.isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
            blurRadius: context.isDark ? 10 : 15,
            spreadRadius: context.isDark ? 0 : 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title + Switch (same everywhere)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(title, style: TextStyle(fontWeight: FontWeight.w700, color: context.isDark ? Colors.white : Colors.black)), switchWidget],
          ),

          /// Body
          Expanded(child: Center(child: child)),
        ],
      ),
    );
  }
}
