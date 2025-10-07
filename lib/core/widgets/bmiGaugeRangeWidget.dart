import 'package:bmi_calculator_app/core/utils/app_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../features/bmi/provider/bmi_provider.dart';

class BMIGaugeRange extends StatelessWidget {
  const BMIGaugeRange({super.key, required this.bmi});

  final double bmi;

  // Constants
  static const double _gaugeThickness = 0.2;
  static const double _pointerSize = 25;
  static const double _bmiTextSize = 34;
  static const double _radiusFactor = 0.9;
  static const double _annotationPosFactor = 0.1;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 500,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 10,
          maximum: 40,
          startAngle: 180,
          endAngle: 0,
          showTicks: false,
          showLabels: false,
          radiusFactor: _radiusFactor,
          axisLineStyle: AxisLineStyle(
            thickness: _gaugeThickness,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
            color: Colors.grey.shade800,
          ),
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 10,
              endValue: 18.5,
              color: Colors.yellow.shade600,
              startWidth: _gaugeThickness,
              endWidth: _gaugeThickness,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.green,
              startWidth: _gaugeThickness,
              endWidth: _gaugeThickness,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 24.9,
              endValue: 29.9,
              color: Colors.orange,
              startWidth: _gaugeThickness,
              endWidth: _gaugeThickness,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 29.9,
              endValue: 40,
              color: Colors.red,
              startWidth: _gaugeThickness,
              endWidth: _gaugeThickness,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          pointers: <GaugePointer>[
            WidgetPointer(
              value: bmi,
              enableAnimation: true,
              child: Icon(
                EvaIcons.arrowUp,
                color: AppColors.accentBlueDarkColor,
                size: _pointerSize,
              ),
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer<BmiProvider>(
                    builder: (context, bmiProvider, child) {
                      return Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: _bmiTextSize,
                          fontWeight: FontWeight.bold,
                          color: bmiProvider.getBMIColor(bmi),
                        ),
                      );
                    },
                  ),
                  Text(
                    'kg/m²',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              angle: 90,
              positionFactor: _annotationPosFactor,
            ),
          ],
        ),
      ],
    );
  }
}
