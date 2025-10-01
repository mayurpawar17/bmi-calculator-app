import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_event.dart';
import 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(const BmiState()) {
    // ---------------- Gender ----------------
    on<GenderSelected>((event, emit) {
      emit(state.copyWith(isMale: event.isMale));
    });

    // ---------------- Height ----------------
    on<HeightChangedCm>((event, emit) {
      emit(state.copyWith(heightCm: event.cmValue));
    });

    on<HeightChangedFtIn>((event, emit) {
      final cm = (event.feet * 30.48) + (event.inches * 2.54);
      print('CM => $cm');
      emit(state.copyWith(heightCm: cm));
    });

    on<HeightUnitToggled>((event, emit) {
      emit(state.copyWith(isCm: event.isCm));
    });

    // ---------------- Weight ----------------
    on<WeightChangedKg>((event, emit) {
      emit(state.copyWith(weight: event.kgValue));
    });

    on<WeightChangedLbs>((event, emit) {
      final kg = event.lbsValue * 0.453592; // lbs → kg
      print('KG => $kg');
      emit(state.copyWith(weight: kg));
    });

    on<WeightUnitToggled>((event, emit) {
      emit(state.copyWith(isKg: event.isKg));
    });

    // ---------------- Calculate BMI ----------------
    on<CalculateBMI>((event, emit) {
      if (state.heightCm <= 0 || state.weight <= 0) return;

      final heightM = state.heightCm / 100; // cm → m
      final bmi = state.weight / (heightM * heightM);

      emit(state.copyWith(bmiResult: bmi, bmiCategory: _getBmiCategory(bmi)));
    });
  }

  //Helper for BMI category
  String _getBmiCategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi <= 24.9) return "Normal";
    if (bmi <= 29.9) return "Overweight";
    return "Obese";
  }
}
