import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_event.dart';
import 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(const BmiState()) {
    on<WeightUnitToggled>((event, emit) {
      emit(state.copyWith(isKg: event.isKg));
    });

    on<HeightUnitToggled>((event, emit) {
      emit(state.copyWith(isCm: event.isCm));
    });

    // on<UpdateHeightEvent>((event, emit) {
    //   emit(state.copyWith(heightCm: event.heightCm));
    // });
    //
    // on<UpdateWeightEvent>((event, emit) {
    //   emit(state.copyWith(weight: event.weight));
    // });
  }
}
