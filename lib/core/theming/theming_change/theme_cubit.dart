import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(ThemeMode.system)); // Default to system theme

  // Singleton accessor
  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);
  ThemeMode get themeMode => state.themeMode;
  // Toggle between light and dark themes
ThemeData getTheme() => state.themeMode == ThemeMode.light ? ThemeData.light(useMaterial3: false) : ThemeData.dark();
  Future<void> toggleTheme() async {
    if (state.themeMode == ThemeMode.light) {
      emit(ThemeChanged(ThemeMode.dark));
    } else {
      emit(ThemeChanged(ThemeMode.light));
    }
  }

  // Optionally set to system theme
  void setSystemTheme() {
    emit(ThemeChanged(ThemeMode.system));
  }
}
