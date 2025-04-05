import 'package:go_router/go_router.dart';
import 'package:quick_opd/feature/hospital/presentation/screens/hospital_details_screen.dart';
import 'app_route_path.dart';
import 'routes.dart';

class AppRouteConf {
  GoRouter get router => _router;

  late final _router = GoRouter(
    initialLocation: AppRoute.landingPage.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoute.landingPage.path,
        name: AppRoute.landingPage.name,
        builder: (_, __) => const LandingScreen(),
      ),
      GoRoute(
        path: AppRoute.loginPage.path,
        name: AppRoute.loginPage.name,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoute.otpPage.path,
        name: AppRoute.otpPage.name,
        builder: (_, __) => const OtpVerifyScreen(),
      ),
      GoRoute(
        path: AppRoute.personalDetails.path,
        name: AppRoute.personalDetails.name,
        builder: (_, __) => const PersonalDetailsScreen(),
      ),
      GoRoute(
        path: AppRoute.bookedAppointmentDetails.path,
        name: AppRoute.bookedAppointmentDetails.name,
        builder: (_, __) => const BookedAppointmentDetails(),
      ),
      GoRoute(
        path: AppRoute.doctorsListScreen.path,
        name: AppRoute.doctorsListScreen.name,
        builder: (_, __) => DoctorListScreen(),
      ),
      GoRoute(
        path: AppRoute.doctorsDetailsScreen.path,
        name: AppRoute.doctorsDetailsScreen.name,
        builder: (_, __) => const DoctorDetailsPage(),
      ),
      GoRoute(
        path: AppRoute.appointmentedPatientDetails.path,
        name: AppRoute.appointmentedPatientDetails.name,
        builder: (_, __) => const AppointmentedPatientDetails(),
      ),
      GoRoute(
        path: AppRoute.bookAnAppointmentScreen.path,
        name: AppRoute.bookAnAppointmentScreen.name,
        builder: (_, __) => const BookAnAppointmentScreen(),
      ),
      GoRoute(
        path: AppRoute.myAppointmentScreen.path,
        name: AppRoute.myAppointmentScreen.name,
        builder: (_, __) => const MyAppointmentScreen(),
      ),
      GoRoute(
        path: AppRoute.homeScreen.path,
        name: AppRoute.homeScreen.name,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoute.mainScreen.path,
        name: AppRoute.mainScreen.name,
        builder: (_, __) => const MainScreen(),
      ),
      GoRoute(
        path: AppRoute.hospitalListScreen.path,
        name: AppRoute.hospitalListScreen.name,
        builder: (_, __) => const HospitalListScreen(),
      ),
      GoRoute(
        path: AppRoute.hospitalDetailsScreen.path,
        name: AppRoute.hospitalDetailsScreen.name,
        builder: (_, __) => HospitalDetailsScreen(),
      ),
      GoRoute(
        path: AppRoute.allServicesListScreen.path,
        name: AppRoute.allServicesListScreen.name,
        builder: (_, __) => AllServicesList(),
      ),
    ],
  );
}
      // GoRoute(
      //   path: AppRoute.homeScreen.path,
      //   name: AppRoute.homeScreen.name,
      //   builder: (_, __) => const HomeScreen(),
      // ),

      // GoRoute(
      //   path: AppRoute.otp.path,
      //   name: AppRoute.otp.name,
      //   builder: (_, __) => const OtpScreen(),
      // ),
      // GoRoute(
      //   path: AppRoute.home.path,
      //   name: AppRoute.home.name,
      //   builder: (_, state) {
      //     final params = state.pathParameters;
      //     final user = UserEntity(
      //       username: params["username"],
      //       email: params["email"],
      //       userId: params["user_id"],
      //     );

      //     return HomePage(user: user);
      //   },
      // ),
      // GoRoute(
      //   path: AppRoute.createProduct.path,
      //   name: AppRoute.createProduct.name,
      //   builder: (_, state) {
      //     final context = state.extra as BuildContext;

      //     return CreateProductPage(ctx: context);
      //   },
      // ),
      // GoRoute(
      //   path: AppRoute.updateProduct.path,
      //   name: AppRoute.updateProduct.name,
      //   builder: (_, state) {
      //     final context = state.extra as BuildContext;
      //     final params = state.pathParameters;

      //     final product = UpdateProductParams(
      //       productId: params["product_id"] ?? "",
      //       name: params["product_name"] ?? "",
      //       price: int.tryParse(params["product_price"] ?? "") ?? 0,
      //     );

      //     return UpdateProductPage(
      //       ctx: context,
      //       productParams: product,
      //     );
      //   },
      // ),
  

