import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../screens/input_page.dart';

const activeCardColor2 = Color(0xff3240A1);

class BMIGaugeRange extends StatelessWidget {
  final double bmi;
  final Gender? gender;
  const BMIGaugeRange({super.key, required this.bmi, required this.gender});

  @override
  Widget build(BuildContext context) {
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
          radiusFactor: 0.9,
          axisLineStyle: AxisLineStyle(
            thickness: 0.2,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
            color: Colors.grey.shade800,
          ),
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 10,
              endValue: 18.5,
              color: Colors.yellow.shade600,
              startWidth: 0.2,
              endWidth: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              color: Colors.green,
              startWidth: 0.2,
              endWidth: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 24.9,
              endValue: 29.9,
              color: Colors.orange,
              startWidth: 0.2,
              endWidth: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
            ),
            GaugeRange(
              startValue: 29.9,
              endValue: 40,
              color: Colors.red,
              startWidth: 0.2,
              endWidth: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          pointers: <GaugePointer>[
            WidgetPointer(
              value: bmi,
              enableAnimation: true,
              child: gender==Gender.male?Icon(
                Foundation.male,
                // color: _getBMIColor(bmi),
                color: Colors.white,
                size: 36,
              ):Icon(
                Foundation.female,
                // color: _getBMIColor(bmi),
                color: Colors.white,
                size: 36,
              ),
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: GoogleFonts.montserrat(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: _getBMIColor(bmi),
                    ),
                  ),
                  // Text(
                  //   'kg/m²',
                  //   style: GoogleFonts.montserrat(
                  //     color: Colors.white70,
                  //     fontSize: 16,
                  //   ),
                  // ),
                ],
              ),
              angle: 90,
              positionFactor: 0.1,
            ),
          ],
        ),
      ],
    );
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) return Colors.yellow;
    if (bmi < 24.9) return Colors.green;
    if (bmi < 29.9) return Colors.orange;
    return Colors.red;
  }
}
