import 'package:get_it/get_it.dart';
import 'package:quick_opd/feature/appointment/presentation/bloc_cubit/appoinment_toggle_cubit/appointment_toggle_cubit.dart';

final getIt = GetIt.instance;

void appointmentDependencieInjections() {
  getIt.registerLazySingleton<AppointmentToggleCubit>(
      () => AppointmentToggleCubit());
}
