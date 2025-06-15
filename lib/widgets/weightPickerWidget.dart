import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightPickerWidget extends StatefulWidget {
  const WeightPickerWidget({super.key, required this.onWeightSelected});

  final Function(int) onWeightSelected; // callback
  @override
  WeightPickerWidgetState createState() => WeightPickerWidgetState();
}

class WeightPickerWidgetState extends State<WeightPickerWidget> {
  int selectedWeight = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // height: 200,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.5,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: selectedWeight - 10,
            ),
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              setState(() {
                selectedWeight = index + 10;
              });
              widget.onWeightSelected(selectedWeight); // notify parent
            },
            children: List<Widget>.generate(200, (index) {
              return Center(
                child: Text(
                  '${index + 10}',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
