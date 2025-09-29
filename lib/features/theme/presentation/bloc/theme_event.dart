import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleTheme extends ThemeEvent {}

// class ToggleTheme extends ThemeEvent {
//   final AppTheme appTheme;
//
//   ToggleTheme(this.appTheme);
//
//   @override
//   List<Object?> get props => [appTheme];
// }

class LoadTheme extends ThemeEvent {
  @override
  List<Object?> get props => [];
} // for loading from SharedPreferences
