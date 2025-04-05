import 'package:get_it/get_it.dart';

import 'package:quick_opd/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:quick_opd/feature/authentication/presentation/bloc_cubit/login_cubit/login_cubit.dart';
import 'package:quick_opd/feature/authentication/presentation/bloc_cubit/otp_cubit/otp_cubit.dart';

final getIt = GetIt.instance;

void authDependencieInjections() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt()));
  
}
