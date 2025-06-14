import 'package:flutter/material.dart';

const activeCardColor2 = Color(0xff3240A1);

class HeightPickerPage extends StatefulWidget {
  final Function(int) onHeightSelected;
  const HeightPickerPage({super.key, required this.onHeightSelected});

  @override
  _HeightPickerPageState createState() => _HeightPickerPageState();
}

class _HeightPickerPageState extends State<HeightPickerPage> {
  int selectedFeet = 5;
  int selectedInches = 4;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Feet dropdown
            DropdownButton<int>(
              iconEnabledColor: activeCardColor2,
              value: selectedFeet,
              dropdownColor: activeCardColor2,
              items: List.generate(6, (index) {
                int ft = index + 3; // 3 to 8 feet
                return DropdownMenuItem(
                  value: ft,
                  child: Text("$ft ft", style: TextStyle(color: Colors.white,fontSize: 20)),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedFeet = value!;
                });
                int heightInCm = ((selectedFeet * 12 + selectedInches) * 2.54).round();
                widget.onHeightSelected(heightInCm);
              },
            ),
            SizedBox(width: 20),
            // Inches dropdown
            DropdownButton<int>(
              iconEnabledColor: activeCardColor2,
              value: selectedInches,
              dropdownColor: activeCardColor2,
              items: List.generate(12, (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text(
                    "$index in",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedInches = value!;
                });
                int heightInCm = ((selectedFeet * 12 + selectedInches) * 2.54).round();
                widget.onHeightSelected(heightInCm);
              },
            ),
          ],
        ),
      ],
    );
  }
}
