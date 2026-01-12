import 'dart:math';

import 'package:bmi_calculator_app/core/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BMIGaugeChart extends StatelessWidget {
  final double bmi;

  const BMIGaugeChart({super.key, required this.bmi});

  static const double _minBMI = 10;
  static const double _maxBMI = 40;

  double get _clampedBMI => bmi.clamp(_minBMI, _maxBMI);

  double get _needleAngle {
    final percent = (_clampedBMI - _minBMI) / (_maxBMI - _minBMI);
    return pi * percent;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Gauge background
          PieChart(PieChartData(startDegreeOffset: 180, sectionsSpace: 0, centerSpaceRadius: 90, sections: _buildSections()), swapAnimationDuration: const Duration(milliseconds: 600)),

          /// Smooth animated needle
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: _needleAngle),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutBack,
            builder: (context, angle, child) {
              return Transform.rotate(angle: angle, child: child);
            },
            child: Icon(Icons.navigation, size: 36, color: AppColors.primaryColor),
          ),

          /// BMI Value
          Positioned(
            bottom: 40,
            child: Column(
              children: [Text(bmi.toStringAsFixed(1), style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: _getBMIColor(bmi))), const Text('kg/m²', style: TextStyle(fontSize: 14))],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    return [_section(18.5 - 10, Colors.yellow.shade600), _section(24.9 - 18.5, Colors.green), _section(29.9 - 24.9, Colors.orange), _section(40 - 29.9, Colors.red)];
  }

  PieChartSectionData _section(double value, Color color) {
    return PieChartSectionData(value: value, color: color, radius: 18, showTitle: false);
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) return Colors.yellow.shade700;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }
}
