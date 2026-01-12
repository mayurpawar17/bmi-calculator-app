import 'package:bmi_calculator_app/core/utils/helper_methods.dart';
import 'package:flutter/cupertino.dart';

class CustomCupertinoPicker extends StatefulWidget {
  const CustomCupertinoPicker({super.key, required this.valueList, required this.unitText, required this.initialValue, this.onSelectedItemChanged});

  final List<int> valueList;
  final String unitText;
  final ValueChanged<int>? onSelectedItemChanged;
  final int initialValue;

  @override
  State<CustomCupertinoPicker> createState() => _CustomCupertinoPickerState();
}

class _CustomCupertinoPickerState extends State<CustomCupertinoPicker> {
  late final FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final pickerHeight = constraints.maxHeight.clamp(90.0, 140.0);
        final pickerWidth = constraints.maxWidth * 0.45;

        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: pickerHeight,
                width: pickerWidth,
                child: CupertinoPicker(
                  scrollController: _controller,
                  itemExtent: 35,
                  magnification: 1.2,
                  squeeze: 1.2,
                  useMagnifier: true,
                  onSelectedItemChanged: widget.onSelectedItemChanged,
                  children: widget.valueList.map((item) => Center(child: Text('$item', style: const TextStyle(fontSize: 14)))).toList(),
                ),
              ),

              const SizedBox(width: 8),

              /// Prevent text overflow
              Flexible(
                child: Text(
                  widget.unitText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.w700, color: context.isDark ? CupertinoColors.white : CupertinoColors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
