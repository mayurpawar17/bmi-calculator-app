import 'package:equatable/equatable.dart';

abstract class BmiEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GenderSelected extends BmiEvent {
  final bool isMale; // "male" or "female"
  GenderSelected(this.isMale);

  @override
  // TODO: implement props
  List<Object?> get props => [isMale];
}

class HeightChanged extends BmiEvent {
  final double value;
  final bool isCm; // true if cm, false if ft/inch
  HeightChanged(this.value, {this.isCm = true});

  @override
  // TODO: implement props
  List<Object?> get props => [value, isCm];
}

class HeightFtInChanged extends BmiEvent {
  final int feet;
  final int inches;

  HeightFtInChanged(this.feet, this.inches);

  @override
  // TODO: implement props
  List<Object?> get props => [feet, inches];
}

class HeightUnitToggled extends BmiEvent {
  final bool isCm;

  HeightUnitToggled(this.isCm);

  @override
  // TODO: implement props
  List<Object?> get props => [isCm];
}

class WeightUnitToggled extends BmiEvent {
  final bool isKg;

  WeightUnitToggled(this.isKg);

  @override
  // TODO: implement props
  List<Object?> get props => [isKg];
}

class WeightChanged extends BmiEvent {
  final double value;
  final bool isKg;

  WeightChanged(this.value, {this.isKg = true});

  @override
  // TODO: implement props
  List<Object?> get props => [value, isKg];
}

class CalculateBMI extends BmiEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
