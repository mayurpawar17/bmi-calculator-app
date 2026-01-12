import 'package:bmi_calculator_app/features/bmi/presentation/widgets/unit_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/bmi_provider.dart';
import 'bmi_section_card.dart';
import 'custom_cupertino_picker.dart';
import 'custom_slider.dart';

class CustomHeightCard extends StatelessWidget {
  CustomHeightCard({super.key});

  final feetList = List.generate(6, (i) => i + 3);
  final inchList = List.generate(12, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
      builder: (context, bmi, _) {
        return BmiSectionCard(
          title: 'Height',
          switchWidget: UnitToggleSwitch(leftLabel: 'Cm', rightLabel: 'Ft', isLeftActive: bmi.isCm, onLeftTap: bmi.heightToggle, onRightTap: bmi.heightToggle),
          child:
              bmi.isCm
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSlider(
                        value: bmi.heightCm,
                        onChanged: (v) {
                          bmi.setHeight(v);
                          bmi.calculateBmi();
                        },
                      ),
                      Text('${bmi.heightCm.toInt()} Cm'),
                    ],
                  )
                  : Row(
                    children: [
                      Expanded(
                        child: CustomCupertinoPicker(
                          valueList: feetList,
                          unitText: 'Ft',
                          initialValue: feetList.indexOf(bmi.feet.toInt()),
                          onSelectedItemChanged: (i) {
                            bmi.setFeet(feetList[i].toDouble());
                            bmi.calculateBmi();
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomCupertinoPicker(
                          valueList: inchList,
                          unitText: 'In',
                          initialValue: inchList.indexOf(bmi.inches.toInt()),
                          onSelectedItemChanged: (i) {
                            bmi.setInches(inchList[i].toDouble());
                            bmi.calculateBmi();
                          },
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
