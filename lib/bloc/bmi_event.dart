abstract class BmiEvent {}

class GenderSelected extends BmiEvent {
  final bool isMale; // "male" or "female"
  GenderSelected(this.isMale);
}

class HeightChanged extends BmiEvent {
  final double value;
  final bool isCm; // true if cm, false if ft/inch
  HeightChanged(this.value, {this.isCm = true});
}

class HeightFtInChanged extends BmiEvent {
  final int feet;
  final int inches;
  HeightFtInChanged(this.feet, this.inches);
}

class WeightChanged extends BmiEvent {
  final double value;
  final bool isKg;
  WeightChanged(this.value, {this.isKg = true});
}

class CalculateBMI extends BmiEvent {}
