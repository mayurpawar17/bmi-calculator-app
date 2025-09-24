import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CustomCupertinoPicker extends StatelessWidget {
  CustomCupertinoPicker({super.key});

  final List<int> _items = [
    150,
    155,
    160,
    163, // Approx. average female height in some regions
    165,
    170,
    175,
    177, // Approx. average male height in some regions
    180,
    183,
    185,
    190,
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.15;
    final width = MediaQuery.of(context).size.width * 0.35;
    return Row(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: CupertinoPicker(
            itemExtent: 35.0,
            onSelectedItemChanged: (int newIndex) {
              // setState(() {
              //   _selectedIndex = newIndex;
              // });

              // --- Trigger Haptic Feedback ---
              HapticFeedback.selectionClick();
            },
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            looping: false,
            children:
                _items.map((int item) {
                  return Center(
                    child: Text('${item}', style: TextStyle(fontSize: 14)),
                  );
                }).toList(),
          ),
        ),
        Text('Ft', style: TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
