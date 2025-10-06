import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../features/bmi/provider/bmi_provider.dart';

class BMIGaugeRange extends StatelessWidget {
  const BMIGaugeRange({super.key, required this.bmi, required this.gender});

  final double bmi;
  final Gender gender;

  // Constants
  static const double _gaugeThickness = 0.2;
  static const double _pointerSize = 27;
  static const double _bmiTextSize = 34;
  static const double _radiusFactor = 0.9;
  static const double _annotationPosFactor = 0.1;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SfRadialGauge(
      enableLoadingAnimation: true,
      animationDuration: 1500,
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
                gender == Gender.male ? Foundation.male : Foundation.female,
                color: Colors.white, // Dynamic color
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
                        style: GoogleFonts.montserrat(
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
