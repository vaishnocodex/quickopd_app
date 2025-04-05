import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_opd/configs/injector/injector_conf.dart';
import 'package:quick_opd/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:quick_opd/core/blocs/theme_cubit/theme_cubit_state.dart';
import 'package:quick_opd/core/themes/app_theme.dart';
import 'package:quick_opd/core/utils/observer.dart';
import 'package:quick_opd/multi_bloc_provider_setup.dart';
import 'package:quick_opd/routes/app_route_conf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  configureDepedencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouteConf>().router;
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: MultiBlocProviderSetup(
            child: BlocBuilder<ThemeCubit, ThemeCubitState>(
          builder: (_, state) {
            debugPrint("isDarkMode=== ${state.isDarkMode}");
            return MaterialApp.router(
              scrollBehavior: SBehavior(),
              debugShowCheckedModeBanner: false,
              theme: AppTheme.data(context, state.isDarkMode),
              routerConfig: router,
            );
          },
        )),
      ),
    );
  }
  
}
/// Custom scroll behaviour widget
class SBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
