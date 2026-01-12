import 'package:bmi_calculator_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UnitToggleSwitch extends StatelessWidget {
  const UnitToggleSwitch({super.key, required this.leftLabel, required this.rightLabel, required this.isLeftActive, required this.onLeftTap, required this.onRightTap});

  final String leftLabel;
  final String rightLabel;
  final bool isLeftActive;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [_switchItem(leftLabel, isLeftActive, onLeftTap), const SizedBox(width: 2), _switchItem(rightLabel, !isLeftActive, onRightTap)]),
    );
  }

  Widget _switchItem(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: isActive ? AppColors.primaryColor : Colors.transparent, borderRadius: BorderRadius.circular(6)),
        child: Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
