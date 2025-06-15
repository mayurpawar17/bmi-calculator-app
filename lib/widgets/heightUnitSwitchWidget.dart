import 'package:flutter/material.dart';

import 'heightPickerWidget.dart';
import 'heightSliderWidget.dart';

class HeightUnitSwitchWidget extends StatefulWidget {
  const HeightUnitSwitchWidget({super.key, required this.onHeightReceived});

  final ValueChanged<int> onHeightReceived;

  @override
  State<HeightUnitSwitchWidget> createState() => _HeightUnitSwitchWidgetState();
}

class _HeightUnitSwitchWidgetState extends State<HeightUnitSwitchWidget> {
  bool _isCm = true;

  // Constants
  static const _activeCardColor = Color(0xff3240A1);
  static const _inactiveTextColor = Color(0xFFA0A3BD);
  static const _animationDuration = Duration(milliseconds: 300);
  static const _borderRadius = 20.0;
  static const _switchPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );
  static const _switchDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    color: Colors.white10,
  );

  void _toggleUnit(bool isCm) {
    setState(() => _isCm = isCm);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Unit Toggle Switch
        Container(
          decoration: _switchDecoration,
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildUnitSwitch(
                label: 'cm',
                isActive: _isCm,
                onTap: () => _toggleUnit(true),
              ),
              _buildUnitSwitch(
                label: 'ft',
                isActive: !_isCm,
                onTap: () => _toggleUnit(false),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Height Input Widget
        _isCm
            ? HeightSliderWidget(
              onSliderHeightSelected: widget.onHeightReceived,
            )
            : HeightPickerWidget(onHeightSelected: widget.onHeightReceived),
      ],
    );
  }

  Widget _buildUnitSwitch({
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: _animationDuration,
        curve: Curves.easeInOut,
        padding: _switchPadding,
        decoration: BoxDecoration(
          color: isActive ? _activeCardColor : Colors.transparent,
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : _inactiveTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
