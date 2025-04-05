import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:quick_opd/configs/injector/injector_conf.dart';
import 'package:quick_opd/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:quick_opd/feature/appointment/presentation/bloc_cubit/appoinment_toggle_cubit/appointment_toggle_cubit.dart';
import 'package:quick_opd/feature/authentication/presentation/bloc_cubit/login_cubit/login_cubit.dart';
import 'package:quick_opd/feature/authentication/presentation/bloc_cubit/otp_cubit/otp_cubit.dart';
import 'package:quick_opd/feature/home/presentation/bloc_cubit/bottom_nav_cubit.dart';

class MultiBlocProviderSetup extends StatelessWidget {
  final Widget child;
  const MultiBlocProviderSetup({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => getIt<ThemeCubit>(),
      ),
      BlocProvider(create: (context) => GetIt.instance<LoginCubit>()),
      BlocProvider(create: (context) => GetIt.instance<OtpCubit>()),
      BlocProvider(
          create: (context) => GetIt.instance<AppointmentToggleCubit>()),
      BlocProvider(create: (context) => BottomNavCubit()),
    ], child: child);
  }
}
