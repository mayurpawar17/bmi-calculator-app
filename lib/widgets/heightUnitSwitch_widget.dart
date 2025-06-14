import 'package:bmi_calculator_app/widgets/heightPicker_widget.dart';
import 'package:bmi_calculator_app/widgets/height_slider.dart';
import 'package:flutter/material.dart';

const activeCardColor2 = Color(0xff3240A1);
const inactiveTextColor = Color(0xFFA0A3BD);

class HeightUnitSwitch extends StatefulWidget {
  const HeightUnitSwitch({super.key, required this.onHeightReceived});

  @override
  _HeightUnitSwitchState createState() => _HeightUnitSwitchState();
  final Function(int) onHeightReceived;
}

class _HeightUnitSwitchState extends State<HeightUnitSwitch> {
  void selectedHeightSlider(int height) {
    setState(() {
      // onHeightSelected=height;
    });
  }

  bool _isCm = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // CM Option
              GestureDetector(
                onTap: () => setState(() => _isCm = true),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _isCm ? activeCardColor2 : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'cm',
                    style: TextStyle(
                      color: _isCm ? Colors.white : inactiveTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              // FT Option
              GestureDetector(
                onTap: () => setState(() => _isCm = false),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: !_isCm ? activeCardColor2 : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'ft',
                    style: TextStyle(
                      color: !_isCm ? Colors.white : inactiveTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        _isCm
            ? HeightSliderScreen(
              onSliderHeightSelected: (height) {
                widget.onHeightReceived(height);
              },
            )
            : HeightPickerPage(
              onHeightSelected: (height) {
                widget.onHeightReceived(height);
              },
            ),
      ],
    );
  }
}
