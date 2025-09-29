import 'package:bmi_calculator_app/core/theme/app_themes.dart';
import 'package:bmi_calculator_app/features/theme/presentation/bloc/theme_event.dart';
import 'package:bmi_calculator_app/features/theme/presentation/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String themeKey = "app_theme";

  ThemeBloc()
    : super(
        ThemeState(themeData: AppThemes.lightTheme, appTheme: AppTheme.light),
      ) {
    on<LoadTheme>(_onLoadTheme);
    on<ToggleTheme>(_onToggleTheme);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(themeKey) ?? "light";

    if (savedTheme == "dark") {
      emit(ThemeState(themeData: AppThemes.darkTheme, appTheme: AppTheme.dark));
    } else {
      emit(
        ThemeState(themeData: AppThemes.lightTheme, appTheme: AppTheme.light),
      );
    }
  }

  Future<void> _onToggleTheme(
    ToggleTheme event,
    Emitter<ThemeState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    if (state.appTheme == AppTheme.dark) {
      await prefs.setString(themeKey, "light");
      emit(
        ThemeState(themeData: AppThemes.lightTheme, appTheme: AppTheme.light),
      );
    } else {
      await prefs.setString(themeKey, "dark");
      emit(ThemeState(themeData: AppThemes.darkTheme, appTheme: AppTheme.dark));
    }
  }
}
