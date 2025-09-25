import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'custom_button2.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({super.key});

  final supportMsg =
      "Hi, I’m Mayur — an indie developer building apps with love.\nYour support keeps me motivated to create more! ☕";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    final width = MediaQuery.of(context).size.width * 0.42;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor2,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(
              0.1,
            ), // Shadow color with some transparency
            spreadRadius: 1, // How far the shadow spreads
            blurRadius: 1, // How blurry the shadow is
            offset: Offset(0, 2 / 2), // Offset of the shadow (x, y)
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ExpansionTile(
          leading: Icon(Icons.favorite_border, color: Colors.black),
          tilePadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          // removes left-right padding
          childrenPadding: EdgeInsets.zero,
          // removes child padding
          collapsedShape: const RoundedRectangleBorder(
            side: BorderSide.none, // removes border when collapsed
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Support Me', style: TextStyle(fontSize: 14)),
          backgroundColor: Colors.white,

          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    supportMsg,
                    style: TextStyle(
                      color: Colors.black,
                      height: 1.4, // Line height for better readability
                    ),
                  ),

                  CustomButton2(text: 'Buy me a Coffee ☕', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
