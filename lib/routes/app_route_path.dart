enum AppRoute {
  landingPage(path: "/landing_screen"),
  loginPage(path: "/login_screen"),
  assignTeacher(path: "/assign_screen"),
  homeScreen(path: "/home_screen"),
  mainScreen(path: "/main_screen"),
  otpPage(path: "/otp_screen"),
  personalDetails(path: "/personal_details_screen"),
  bookedAppointmentDetails(path: "/booking_appointment_details_screen"),
  doctorsListScreen(path: "/doctor_list_screens"),
  allServicesListScreen(path: "/all_services_list_screen"),
  doctorsDetailsScreen(path: "/doctor_details_screens"),
  bookAnAppointmentScreen(path: "/book_an_appointment_screens"),
  myAppointmentScreen(path: "/my_appointment_screen"),
  appointmentedPatientDetails(path: "/appointmented_patient_details"),
  hospitalListScreen(path: "/hospital_list_screens"),
  hospitalDetailsScreen(path: "/hospital_details_screen"),
  commonStatusScreen(path: "/booking_status/:heading/:subheading/:btnTitle"),
  register(path: "register"),
  home(path: "/home/:user_id/:email/:username"),
  createProduct(path: "/product/add"),
  updateProduct(
      path: "/product/update/:product_id/:product_name/:product_price");

  final String path;
  const AppRoute({required this.path});
}
