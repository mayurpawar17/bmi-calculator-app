import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({
    super.key,
    this.icon,
    this.cardText,
    required bool isActive,
  });

  final icon;
  final cardText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Colors.white),
          SizedBox(height: 10),
          Text(
            cardText,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
