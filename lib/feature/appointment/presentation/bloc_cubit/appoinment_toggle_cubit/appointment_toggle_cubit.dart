import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appointment_toggle_state.dart';

class AppointmentToggleCubit extends Cubit<bool> {
  AppointmentToggleCubit() : super(true);
  void toggle(bool isForMyself) {
    emit(isForMyself);
  }
}
