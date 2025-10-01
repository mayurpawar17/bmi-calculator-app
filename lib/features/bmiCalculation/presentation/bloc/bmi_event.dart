import 'package:equatable/equatable.dart';

abstract class BmiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// ------------------ Gender ------------------
class GenderSelected extends BmiEvent {
  final bool isMale;
  GenderSelected(this.isMale);

  @override
  List<Object?> get props => [isMale];
}

// ------------------ Height ------------------
// Direct cm input (from slider)
class HeightChangedCm extends BmiEvent {
  final double cmValue;
  HeightChangedCm(this.cmValue);

  @override
  List<Object?> get props => [cmValue];
}

// Ft + Inch input (from CupertinoPicker)
class HeightChangedFtIn extends BmiEvent {
  final int feet;
  final int inches;
  HeightChangedFtIn(this.feet, this.inches);

  @override
  List<Object?> get props => [feet, inches];
}

// Toggle between cm and ft-in
class HeightUnitToggled extends BmiEvent {
  final bool isCm;
  HeightUnitToggled(this.isCm);

  @override
  List<Object?> get props => [isCm];
}

// ------------------ Weight ------------------
// Direct kg input
class WeightChangedKg extends BmiEvent {
  final double kgValue;
  WeightChangedKg(this.kgValue);

  @override
  List<Object?> get props => [kgValue];
}

// Direct lbs input
class WeightChangedLbs extends BmiEvent {
  final double lbsValue;
  WeightChangedLbs(this.lbsValue);

  @override
  List<Object?> get props => [lbsValue];
}

// Toggle between kg and lbs
class WeightUnitToggled extends BmiEvent {
  final bool isKg;
  WeightUnitToggled(this.isKg);

  @override
  List<Object?> get props => [isKg];
}

// ------------------ Final Action ------------------
class CalculateBMI extends BmiEvent {
  @override
  List<Object?> get props => [];
}
