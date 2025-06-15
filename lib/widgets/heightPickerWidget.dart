import 'package:flutter/material.dart';

class HeightPickerWidget extends StatefulWidget {
  final ValueChanged<int> onHeightSelected;

  const HeightPickerWidget({super.key, required this.onHeightSelected});

  @override
  State<HeightPickerWidget> createState() => _HeightPickerWidgetState();
}

class _HeightPickerWidgetState extends State<HeightPickerWidget> {
  // Constants
  static const _activeColor = Color(0xff3240A1);
  static const _textStyle = TextStyle(color: Colors.white, fontSize: 20);
  static const _spacing = SizedBox(width: 20);
  static const _minFeet = 3;
  static const _maxFeet = 8;
  static const _maxInches = 11; // 0-11 inches
  static const _cmPerInch = 2.54;

  int _selectedFeet = 5;
  int _selectedInches = 4;

  void _updateHeight(int feet, int inches) {
    final totalInches = (feet * 12) + inches;
    final heightInCm = (totalInches * _cmPerInch).round();
    widget.onHeightSelected(heightInCm);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Feet dropdown
            DropdownButton<int>(
              value: _selectedFeet,
              dropdownColor: _activeColor,
              iconEnabledColor: _activeColor,
              style: _textStyle,
              items: List.generate(_maxFeet - _minFeet + 1, (index) {
                final feet = _minFeet + index;
                return DropdownMenuItem(value: feet, child: Text("$feet ft"));
              }),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedFeet = value);
                  _updateHeight(value, _selectedInches);
                }
              },
            ),

            _spacing,

            // Inches dropdown
            DropdownButton<int>(
              value: _selectedInches,
              dropdownColor: _activeColor,
              iconEnabledColor: _activeColor,
              style: _textStyle,
              items: List.generate(_maxInches + 1, (index) {
                return DropdownMenuItem(value: index, child: Text("$index in"));
              }),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedInches = value);
                  _updateHeight(_selectedFeet, value);
                }
              },
            ),
          ],
        ),

        // Display converted height
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "≈ ${((_selectedFeet * 12 + _selectedInches) * _cmPerInch).round()} cm",
            style: _textStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
