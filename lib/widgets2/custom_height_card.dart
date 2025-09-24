import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';
import 'height_switch.dart';

class CustomHeightCard extends StatefulWidget {
  const CustomHeightCard({super.key});

  @override
  State<CustomHeightCard> createState() => _CustomHeightCardState();
}

class _CustomHeightCardState extends State<CustomHeightCard> {
  int _selectedIndex = 0;
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
    final height = MediaQuery.of(context).size.height * 0.3;

    return Container(
      padding: EdgeInsets.all(15),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor2,

        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.024),
            // Shadow color with some transparency
            spreadRadius: 1,
            // How far the shadow spreads
            blurRadius: 20,
            // How blurry the shadow is
            offset: Offset(0, 5), // Changes position of shadow (x, y)
          ),
          // You can add multiple BoxShadows for more complex effects
          // For example, a very subtle, wider shadow underneath
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 25,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Height',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(width: 10),
              HeightSwitch(),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 100,
                width: 140,
                child: CupertinoPicker(
                  itemExtent: 35.0,
                  onSelectedItemChanged: (int newIndex) {
                    setState(() {
                      _selectedIndex = newIndex;
                    });

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
                          child: Text(
                            '${item}',
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                ),
              ),
              Text('Ft', style: TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),

          Text(
            '5 feet 3 inches (160 cm)',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
