import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_opd/core/blocs/theme_cubit/theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeCubitState> {
  ThemeCubit() : super(const ThemeCubitState(false));

  void setLightTheme() => emit(const ThemeCubitState(false));

  void setDarkTheme() => emit(const ThemeCubitState(true));

  ThemeCubitState? fromJson(Map<String, dynamic> json) {
    return ThemeCubitState.fromMap(json);
  }

  Map<String, dynamic>? toJson(ThemeCubitState state) {
    return state.toMap();
  }
}
