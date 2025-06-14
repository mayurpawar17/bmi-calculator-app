import 'package:flutter/material.dart';

const activeCardColor2 = Color(0xff3240A1);

class HeightSliderWidget extends StatefulWidget {
  const HeightSliderWidget({super.key, required this.onSliderHeightSelected});

  final Function(int) onSliderHeightSelected;

  @override
  _HeightSliderWidgetState createState() => _HeightSliderWidgetState();
}

class _HeightSliderWidgetState extends State<HeightSliderWidget> {
  double _height = 170.0; // Default height in cm

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Slider(
            value: _height,
            min: 100.0,
            // Minimum height (100cm)
            max: 250.0,
            // Maximum height (250cm)
            divisions: 150,
            // Steps of 1cm (250-100=150 divisions)
            // label: '${_height.round()} cm',
            // Popup label
            onChanged: (value) {
              setState(() => _height = value);

              widget.onSliderHeightSelected(_height.round());
            },
            activeColor: activeCardColor2,
            inactiveColor: Colors.grey[300],
          ),
          Text(
            '${_height.round()} cm',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
