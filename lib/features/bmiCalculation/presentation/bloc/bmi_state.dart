class BmiState {
  final bool? isMale;
  final double heightCm;
  final double weight;
  final bool isCm;
  final bool isKg;

  const BmiState({
    this.isMale,
    this.heightCm = 170,
    this.weight = 60,
    this.isCm = true,
    this.isKg = true,
  });

  BmiState copyWith({
    bool? isMale,
    double? heightCm,
    double? weight,
    bool? isCm,
    bool? isKg,
  }) {
    return BmiState(
      isMale: isMale ?? this.isMale,
      heightCm: heightCm ?? this.heightCm,
      weight: weight ?? this.weight,
      isCm: isCm ?? this.isCm,
      isKg: isKg ?? this.isKg,
    );
  }
}
