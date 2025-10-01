class BmiState {
  final bool? isMale;
  final double heightCm; // always stored in cm
  final double weight; // always stored in kg
  final bool isCm;
  final bool isKg;
  final double? bmiResult;
  final String? bmiCategory;

  const BmiState({
    this.isMale,
    this.heightCm = 170,
    this.weight = 60,
    this.isCm = true,
    this.isKg = true,
    this.bmiResult,
    this.bmiCategory,
  });

  BmiState copyWith({
    bool? isMale,
    double? heightCm,
    double? weight,
    bool? isCm,
    bool? isKg,
    double? bmiResult,
    String? bmiCategory,
  }) {
    return BmiState(
      isMale: isMale ?? this.isMale,
      heightCm: heightCm ?? this.heightCm,
      weight: weight ?? this.weight,
      isCm: isCm ?? this.isCm,
      isKg: isKg ?? this.isKg,
      bmiResult: bmiResult ?? this.bmiResult,
      bmiCategory: bmiCategory ?? this.bmiCategory,
    );
  }
}
