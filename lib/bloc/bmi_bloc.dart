import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_event.dart';
import 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(const BmiInitial()) {
    on<GenderSelected>((event, emit) {
      emit(
        BmiInputState(
          isMale: event.isMale,
          heightCm: state.heightCm,
          weightKg: state.weightKg,
        ),
      );
    });

    on<HeightChanged>((event, emit) {
      emit(
        BmiInputState(
          isMale: state.isMale,
          heightCm: event.value,
          weightKg: state.weightKg,
        ),
      );
    });

    on<HeightFtInChanged>((event, emit) {
      double cm = (event.feet * 30.48) + (event.inches * 2.54);
      emit(
        BmiInputState(
          isMale: state.isMale,
          heightCm: cm,
          weightKg: state.weightKg,
        ),
      );
    });

    on<WeightChanged>((event, emit) {
      double weight = event.isKg ? event.value : event.value * 0.453592;
      emit(
        BmiInputState(
          isMale: state.isMale,
          heightCm: state.heightCm,
          weightKg: weight,
        ),
      );
    });

    on<CalculateBMI>((event, emit) {
      if (state.isMale == null) {
        emit(
          BmiError(
            message: "Please select your gender before calculating BMI.",
            isMale: state.isMale,
            heightCm: state.heightCm,
            weightKg: state.weightKg,
          ),
        );
        return;
      }

      double heightM = state.heightCm / 100;
      if (heightM <= 0) {
        emit(
          BmiError(
            message: "Invalid height value.",
            isMale: state.isMale,
            heightCm: state.heightCm,
            weightKg: state.weightKg,
          ),
        );
        return;
      }

      double bmi = state.weightKg / pow(heightM, 2);
      emit(
        BmiCalculated(
          bmi: bmi,
          isMale: state.isMale,
          heightCm: state.heightCm,
          weightKg: state.weightKg,
        ),
      );
    });
  }
}
