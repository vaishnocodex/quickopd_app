// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/app_theme.dart';
import 'package:quick_opd/core/themes/app_theme_extension.dart';
import 'package:quick_opd/feature/authentication/presentation/widgets/chip_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';
import 'package:quick_opd/widgets/button_widget.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController nicknameController = TextEditingController();

  final TextEditingController dobController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  int selectedGenderIndex = 0;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  void onGenderSelected(int index) {
    setState(() {
      selectedGenderIndex = index;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLocationPickerDialog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Personal Information",
          style: boldTextStyle(size: 20),
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: AppButtonWidget(
            btnWidth: context.screenWidth * 0.9,
            callback: () => context.pushNamed(AppRoute.mainScreen.name),
            label: "Submit",
          ),
        ),
        20.sHeight
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.sHeight,
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColor.viewLineColor,
                  child: Icon(
                    CupertinoIcons.person,
                    size: 50,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.edit,
                          color: Colors.white, size: 18)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            commonFormField(
              isEditable: true,
              hintText: 'Full Name',
              inputType: TextInputType.text,
              controller: fullNameController,
            ),
            const SizedBox(height: 20),
            commonFormField(
              isEditable: true,
              hintText: 'Nickname',
              inputType: TextInputType.text,
              controller: nicknameController,
            ),
            const SizedBox(height: 20),
            ChipWidget(
              options: genderOptions,
              selectedIndex: selectedGenderIndex,
              onSelect: onGenderSelected,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget authEmailField({
    required String hintText,
    required TextEditingController controller,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: false,
        hintText: hintText,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 3),
          child:
              Icon(Icons.email, size: 21, color: AppColor.textSecondaryColor),
        ),
      ),
    );
  }

  Widget commonFormField(
      {required String hintText,
      IconData? icon,
      IconData? prefixIcon,
      void Function(String)? onFieldSubmitted,
      required TextInputType inputType,
      required TextEditingController controller,
      required bool isEditable,
      VoidCallback? onTap}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      readOnly: !isEditable,
      onFieldSubmitted: onFieldSubmitted,
      // onEditingComplete: onEditingComplete,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 17),
        hintStyle: secondaryTextStyle(),
        suffixIcon: icon != null
            ? Icon(icon, color: AppColor.textSecondaryColor, size: 17)
            : null,
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Icon(prefixIcon,
                    size: 17, color: AppColor.textSecondaryColor),
              )
            : null,
        fillColor: AppColor.lGreyColor,
        filled: true,
        enabledBorder: custInputBorder(color: AppColor.viewLineColor),
        errorBorder: custInputBorder(color: AppColor.pinkColor),
        focusedBorder: custInputBorder(color: AppColor.primaryColor),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime eighteenYearsAgo =
        currentDate.subtract(const Duration(days: 5 * 365));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: eighteenYearsAgo,
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void showLocationPickerDialog() {
    showModalBottomSheet(
      backgroundColor: context.scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Why We Need Your Location",
                style: boldTextStyle(),
              ),
              const SizedBox(height: 8),
              Text(
                "We use your current location to show nearby doctors and clinics for easier appointment booking, provide location-based recommendations, and offer services specific to your area.",
                textAlign: TextAlign.center,
                style: primaryTextStyle(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await getCurrentLocation(); // Call the location function
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text("Grant Location Access"),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); // Close the dialog without granting access
                },
                child: const Text("Maybe Later"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle the error
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Handle permission denial
        showPermissionDeniedDialog();
        return;
      }
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }

  double? latitude;
  double? longitude;

  // Function to show dialog when permission is denied
  void showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Location Permission Denied'),
          content: const Text(
              'Location access is needed to show nearby doctors and clinics. Please enable it from your app settings.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Redirect to app settings
                Geolocator.openAppSettings();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Go to Settings'),
            ),
          ],
        );
      },
    );
  }
}
