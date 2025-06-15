import 'package:bmi_calculator_app/screens/resultScreen.dart';
import 'package:bmi_calculator_app/widgets/childCardWidget.dart';
import 'package:bmi_calculator_app/widgets/customButtonWidget.dart';
import 'package:bmi_calculator_app/widgets/customCardWiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/heightUnitSwitchWidget.dart';
import '../widgets/weightPickerWidget.dart';

enum Gender { male, female }

// Colors
const primaryColor = Color(0xff101010);
const secondaryColor = Color(0xff1E1E1E);
const accentBlueDarkColor = Color(0xff3240A1);
const inactiveCardColor = Color(0xff1E1E1E);

// Default Values
const defaultWeight = 25;
const defaultHeight = 170;
const minHeight = 100; // 1 meter
const maxHeight = 250; // 2.5 meters

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? selectedGender;
  int weight = defaultWeight;
  int height = defaultHeight;

  void handleWeightChange(int newWeight) {
    setState(() => weight = newWeight);
  }

  void handleHeightChange(int newHeight) {
    setState(() => height = newHeight.clamp(minHeight, maxHeight));
  }

  double calculateBmi() {
    if (height == 0) return 0.0; // Prevent division by zero
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  void _handleGenderSelection(Gender gender) {
    setState(() {
      selectedGender = (selectedGender == gender) ? null : gender;
    });
  }

  void _navigateToResults(BuildContext context) {
    if (selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: secondaryColor,
          content: Text('Please select your gender'),
        ),
      );
      return;
    }

    final bmi = calculateBmi();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(bmi: bmi, gender: selectedGender!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Gender Selection Row
          Expanded(
            child: Row(
              children: [
                _buildGenderCard(
                  context,
                  gender: Gender.male,
                  label: 'MALE',
                  icon: Foundation.male,
                ),
                _buildGenderCard(
                  context,
                  gender: Gender.female,
                  label: 'FEMALE',
                  icon: Foundation.female,
                ),
              ],
            ),
          ),

          // Height Selection
          Expanded(
            child: _buildInputCard(
              title: 'Height',
              child: HeightUnitSwitchWidget(
                onHeightReceived: handleHeightChange,
              ),
            ),
          ),

          // Weight Selection
          Expanded(
            child: _buildInputCard(
              title: 'Weight',
              child: WeightPickerWidget(onWeightSelected: handleWeightChange),
            ),
          ),

          // Calculate Button
          CustomButton(
            color: accentBlueDarkColor,
            buttonText: 'Calculate',
            onTap: () => _navigateToResults(context),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderCard(
    BuildContext context, {
    required Gender gender,
    required String label,
    required IconData icon,
  }) {
    final isSelected = selectedGender == gender;

    return Expanded(
      child: CustomCard(
        onTap: () => _handleGenderSelection(gender),
        color: isSelected ? accentBlueDarkColor : inactiveCardColor,
        child: ChildCard(cardText: label, icon: icon, isActive: isSelected),
      ),
    );
  }

  Widget _buildInputCard({required String title, required Widget child}) {
    return Row(
      children: [
        Expanded(
          child: CustomCard(
            color: secondaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
