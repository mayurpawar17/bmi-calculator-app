// import 'package:flutter/material.dart';
// const activeCardColor2 = Color(0xff3240A1);
//
// class HeightUnitSwitch extends StatefulWidget {
//   const HeightUnitSwitch({super.key});
//
//   @override
//   _HeightUnitSwitchState createState() => _HeightUnitSwitchState();
// }
//
// class _HeightUnitSwitchState extends State<HeightUnitSwitch> {
//   bool _isCm = true; // Default to cm
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('cm', style: TextStyle(fontWeight: _isCm ? FontWeight.bold : null,color: Colors.white)),
//         Switch(
//           value: _isCm,
//           inactiveThumbColor: activeCardColor2, // Color when "ft" is selected
//           activeColor: activeCardColor2, // Color when "cm" is selected
//           onChanged: (bool value) {
//             setState(() => _isCm = value);
//           },
//         ),
//         Text('ft', style: TextStyle(fontWeight: _isCm ? null : FontWeight.bold,color: Colors.white)),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

const activeCardColor2 = Color(0xff3240A1);
const inactiveTextColor = Color(0xFFA0A3BD);

class HeightUnitSwitch extends StatefulWidget {
  const HeightUnitSwitch({super.key});

  @override
  _HeightUnitSwitchState createState() => _HeightUnitSwitchState();
}

class _HeightUnitSwitchState extends State<HeightUnitSwitch> {
  bool _isCm = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    );
  }
}