import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightSwitch extends StatefulWidget {
  const HeightSwitch({super.key});

  // final ValueChanged<int> onHeightReceived;

  @override
  State<HeightSwitch> createState() => _HeightSwitchState();
}

class _HeightSwitchState extends State<HeightSwitch> {
  bool _isCm = true;

  // Constants
  static const _activeCardColor = Color(0xff3240A1);
  static const _inactiveTextColor = Color(0xFFA0A3BD);
  static const _animationDuration = Duration(milliseconds: 300);
  static const _borderRadius = 8.0;
  static const _switchPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 4,
  );
  static final _switchDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    // border: Border.all(color: Colors.black),
    // color: Colors.blueAccent,
  );

  void _toggleUnit(bool isCm) {
    HapticFeedback.selectionClick();
    setState(() => _isCm = isCm);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _switchDecoration,
      padding: const EdgeInsets.all(2),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildUnitSwitch(
            label: 'Cm',
            isActive: _isCm,
            onTap: () => _toggleUnit(true),
          ),
          SizedBox(width: 2),
          _buildUnitSwitch(
            label: 'Ft',
            isActive: !_isCm,
            onTap: () => _toggleUnit(false),
          ),
        ],
      ),
    );
    // return Column(
    //   children: [
    //     // Unit Toggle Switch
    //     Container(
    //       decoration: _switchDecoration,
    //       padding: const EdgeInsets.all(2),
    //
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           _buildUnitSwitch(
    //             label: 'Cm',
    //             isActive: _isCm,
    //             onTap: () => _toggleUnit(true),
    //           ),
    //           _buildUnitSwitch(
    //             label: 'Ft',
    //             isActive: !_isCm,
    //             onTap: () => _toggleUnit(false),
    //           ),
    //         ],
    //       ),
    //     ),
    //
    //     // const SizedBox(height: 16),
    //
    //     // Height Input Widget
    //     // _isCm
    //     //     ? HeightSliderWidget(
    //     //   onSliderHeightSelected: widget.onHeightReceived,
    //     // )
    //     //     : HeightPickerWidget(onHeightSelected: widget.onHeightReceived),
    //   ],
    // );
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
