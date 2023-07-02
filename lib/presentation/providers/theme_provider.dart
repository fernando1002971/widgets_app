import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//Provider inmutable listado de colores que no cambia
final colorListProvider = Provider((ref) => colorList);

//Boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);


//int
final selectedColorProvider = StateProvider<int>((ref) => 0);
