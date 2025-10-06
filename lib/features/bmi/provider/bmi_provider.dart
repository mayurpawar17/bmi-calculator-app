import 'package:flutter/material.dart';

enum Gender { male, female }

enum HeightUnit { cm, ft }

enum WeightUnit { kg, lbs }

class BmiProvider extends ChangeNotifier {
  double _heightCm = 170.0; // Always stored in cm
  double _feet = 5.0;
  double _inches = 7.0;
  double _weightKg = 70.0; // Always stored in kg
  double _lbs = 140.0;
  double? _bmiResult;
  String? _bmiCategory;
  String? _bmiMsg;
  Gender? _selectedGender;
  HeightUnit _heightUnit = HeightUnit.cm;
  WeightUnit _weightUnit = WeightUnit.kg;

  // ===== Getters =====
  double get heightCm => _heightCm;

  double get weightKg => _weightKg;

  double? get bmiResult => _bmiResult;

  String? get bmiCategory => _bmiCategory;
  String? get bmiMsg => _bmiMsg;

  double get feet => _feet;

  double get inches => _inches;

  double get lbs => _lbs;

  Gender? get selectedGender => _selectedGender;

  bool get isCm => _heightUnit == HeightUnit.cm;

  bool get isKg => _weightUnit == WeightUnit.kg;

  // ===== Setters =====
  void setHeightUnit(HeightUnit newUnit) {
    if (_heightUnit == newUnit) return;
    _heightUnit = newUnit;
    notifyListeners();
  }

  void setWeightUnit(WeightUnit newUnit) {
    if (_weightUnit == newUnit) return;
    _weightUnit = newUnit;
    notifyListeners();
  }

  void heightToggle() {
    _heightUnit = _heightUnit == HeightUnit.cm ? HeightUnit.ft : HeightUnit.cm;
    notifyListeners();
  }

  void weightToggle() {
    _weightUnit = _weightUnit == WeightUnit.kg ? WeightUnit.lbs : WeightUnit.kg;
    notifyListeners();
  }

  void setHeight(double newHeight) {
    _heightCm = newHeight;
    notifyListeners();
  }

  void setFeet(double newFeet) {
    _feet = newFeet;
    notifyListeners();
  }

  void setInches(double newInches) {
    _inches = newInches;
    notifyListeners();
  }

  void setLbs(int newLbs) {
    _lbs = newLbs.toDouble();
    notifyListeners();
  }

  void setWeight(double newWeight) {
    if (_weightUnit == WeightUnit.kg) {
      _weightKg = newWeight;
    } else {
      _weightKg = lbsToKg(newWeight);
    }
    notifyListeners();
  }

  void genderSelection(Gender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  // ===== Conversion Helpers =====
  double ftToCm(double ft, double inch) => (ft * 30.48) + (inch * 2.54);

  double lbsToKg(double lbs) => lbs * 0.453592;

  // ===== BMI Calculation =====
  void calculateBmi() {
    double height =
        _heightUnit == HeightUnit.ft ? ftToCm(_feet, _inches) : _heightCm;

    if (height <= 0 || _weightKg <= 0) return;

    double heightM = height / 100; // convert cm → meters
    _bmiResult = _weightKg / (heightM * heightM);
    _bmiCategory = _getBmiCategory(_bmiResult!);
    _bmiMsg = _getBmiMsg(_bmiResult!);

    notifyListeners();
  }

  String _getBmiCategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 24.9) return "Normal";
    if (bmi < 29.9) return "Overweight";
    return "Obese";
  }

  String _getBmiMsg(double bmi) {
    if (bmi < 18.5) return "You're a bit light! Add some healthy meals 🍲";
    if (bmi < 24.9) return "Perfect balance! Keep it up 💪";
    if (bmi < 29.9)
      return "A little above the mark — time for a fitness boost 🏃‍♂️";
    return "Let's focus on a healthier routine 🌿";
  }

  Color getBMIColor(double bmi) {
    if (bmi < 18.5) return Colors.yellow.shade600;
    if (bmi < 24.9) return Colors.green;
    if (bmi < 29.9) return Colors.orange;
    return Colors.red;
  }
}
