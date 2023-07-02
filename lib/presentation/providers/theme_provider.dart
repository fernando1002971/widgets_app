import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Provider:valores inmutables. Listado de colores que no cambia.
final colorListProvider = Provider((ref) => colorList);

//StateProvider: Mantener alguna pieza de estado. Boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

//int
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Objeto del tipo AppTheme
//StateNotifierProvider: Mantener algun estado basado en algún objeto mas complejo
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //State = Estado = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
     state = state.copyWith(selectedColor: colorIndex);
  }
}
