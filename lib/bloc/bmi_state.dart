abstract class BmiState {
  final bool? isMale;
  final double heightCm;
  final double weightKg;
  final bool? isCm;
  final bool? isKg;

  const BmiState({
    required this.isMale,
    this.heightCm = 170,
    this.weightKg = 60,
    this.isCm,
    this.isKg,
  });
}

class BmiInitial extends BmiState {
  const BmiInitial()
    : super(isKg: null, isCm: null, isMale: null, heightCm: 170, weightKg: 60);
}

class BmiInputState extends BmiState {
  const BmiInputState({
    bool? isMale,
    double heightCm = 170,
    double weightKg = 60,
    final bool? isCm = null,
    final bool? isKg = null,
  }) : super(isMale: isMale, heightCm: heightCm, weightKg: weightKg);
}

class BmiCalculated extends BmiState {
  final double bmi;

  const BmiCalculated({
    required this.bmi,
    bool? isMale,
    required double heightCm,
    required double weightKg,
  }) : super(isMale: isMale, heightCm: heightCm, weightKg: weightKg);
}

class BmiError extends BmiState {
  final String message;

  const BmiError({
    required this.message,
    bool? isMale,
    double heightCm = 170,
    double weightKg = 60,
  }) : super(isMale: isMale, heightCm: heightCm, weightKg: weightKg);
}
