import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.height,
    this.width,
    required this.color,
    this.child,
    this.onTap,
  });

  final double? height;
  final double? width;
  final Color color; // Consider making this nullable (Color?) if needed
  final Widget? child;
  final VoidCallback? onTap; // More specific type than dynamic

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        height: height,
        width: width,
        margin: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
