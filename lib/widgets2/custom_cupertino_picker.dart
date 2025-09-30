import 'package:flutter/cupertino.dart';

class CustomCupertinoPicker extends StatelessWidget {
  CustomCupertinoPicker({
    super.key,
    required this.valueList,
    required this.unitText,
    this.onSelectedItemChanged,
  });

  final List<int> valueList;
  final String unitText;
  final onSelectedItemChanged;

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
            onSelectedItemChanged: onSelectedItemChanged,
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            looping: false,
            children:
                valueList.map((int item) {
                  return Center(
                    child: Text('${item}', style: TextStyle(fontSize: 14)),
                  );
                }).toList(),
          ),
        ),
        Text(unitText, style: TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
