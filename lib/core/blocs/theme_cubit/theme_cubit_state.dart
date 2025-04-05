import 'package:equatable/equatable.dart';

class ThemeCubitState extends Equatable {
  final bool isDarkMode;

  const ThemeCubitState(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];

  factory ThemeCubitState.fromMap(Map<String, dynamic> map) {
    return ThemeCubitState(map["isDarkMode"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "isDarkMode": isDarkMode,
    };
  }
}