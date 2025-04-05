import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:quick_opd/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:quick_opd/feature/appointment/presentation/di/appointment_dependency.dart';
import 'injector.dart';

final getIt = GetIt.I;

void configureDepedencies() {
  getIt.registerLazySingleton(() => ThemeCubit());

  getIt.registerLazySingleton(() => AppRouteConf());

  getIt.registerLazySingleton(
      () => Dio()..interceptors.add(getIt<ApiInterceptor>()));

  getIt.registerLazySingleton(() => ApiInterceptor());

  // First, register FlutterSecureStorage
  getIt.registerLazySingleton(() => const FlutterSecureStorage());

  // Then register SecureLocalStorage (since it depends on FlutterSecureStorage)
  getIt.registerLazySingleton(
      () => SecureLocalStorage(getIt<FlutterSecureStorage>()));

  getIt.registerLazySingleton(
      () => NetworkInfo(getIt<InternetConnectionChecker>()));

  getIt.registerLazySingleton(() => InternetConnectionChecker());

  // Register ApiHelper after Dio is registered
  getIt.registerLazySingleton(() => ApiHelper(getIt<Dio>()));

  // Now, call auth dependencies
  authDependencieInjections();

  appointmentDependencieInjections();
}
