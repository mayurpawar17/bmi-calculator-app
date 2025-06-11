import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({super.key, this.icon, this.cardText});

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
            style: GoogleFonts.montserrat(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
