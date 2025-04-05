import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // Default to Home screen

  void updateIndex(int index) {
    emit(index);
  }
}
