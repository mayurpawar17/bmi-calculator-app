import 'package:bmi_calculator_app/features/bmi/presentation/widgets/unit_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/bmi_provider.dart';
import 'bmi_section_card.dart';
import 'custom_cupertino_picker.dart';

class CustomWeightCard extends StatelessWidget {
  CustomWeightCard({super.key});

  final kgList = List.generate(200, (i) => i + 10);
  final lbsList = List.generate(420, (i) => 22 + i);

  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
      builder: (context, bmi, _) {
        return BmiSectionCard(
          title: 'Weight',
          switchWidget: UnitToggleSwitch(leftLabel: 'Kg', rightLabel: 'Lbs', isLeftActive: bmi.isKg, onLeftTap: bmi.weightToggle, onRightTap: bmi.weightToggle),
          child: SizedBox(
            width: 150,
            child: CustomCupertinoPicker(
              valueList: bmi.isKg ? kgList : lbsList,
              unitText: bmi.isKg ? 'Kg' : 'Lbs',
              initialValue: bmi.isKg ? kgList.indexOf(bmi.weightKg.toInt()) : lbsList.indexOf(bmi.lbs.toInt()),
              onSelectedItemChanged: (i) {
                bmi.setWeight((bmi.isKg ? kgList[i] : lbsList[i]).toDouble());
                bmi.calculateBmi();
              },
            ),
          ),
        );
      },
    );
  }
}
