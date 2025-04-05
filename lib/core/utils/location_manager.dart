// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quick_opd/widgets/dialog_widget.dart';

class LocationManager {
  static final LocationManager _instance = LocationManager._internal();

  factory LocationManager() {
    return _instance;
  }

  LocationManager._internal();
  double? _latitude;
  double? _longitude;
  ValueNotifier<String> addressNotifier = ValueNotifier("Fetching location...");

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String get address => addressNotifier.value;

// Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<void> checkAndRequestLocationPermission(BuildContext context) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // CommonBottomDialog().showLocationPickerDialog(context);
        showPermissionDeniedDialog(context);
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          showPermissionDeniedDialog(context);
          return;
        }
      }
      // Get location if permission granted
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      debugPrint(
          "Current Location: ${position.latitude}, ${position.longitude}");
      _latitude = position.latitude;
      _longitude = position.longitude;
      String newAddress =
          await getAddressFromLatLng(position.latitude, position.longitude);
      addressNotifier.value = newAddress;
      debugPrint("Current Address: $address");
    } catch (e) {
      debugPrint("Something went wrong: $e");
      addressNotifier.value = "Failed to fetch location";
    }
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks.first;
      return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      debugPrint("Error getting address: $e");
      return "Unknown Location";
    }
  }

  Future<void> showPermissionDeniedDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AppDialog(
            icon: Icons.location_off,
            title: "Location Permission Denied",
            subTitle:
                "Location access is needed to show nearby doctors and clinics. Please enable it from your app settings.",
            btnTitle: "Go to Settings",
            callback: () {
              Geolocator.openAppSettings();
              Navigator.of(context).pop();
            },
          );
        });
  }
}





// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';

// import 'package:geolocator/geolocator.dart';

// import 'package:quick_opd/core/themes/app_font.dart';
// import 'package:quick_opd/core/themes/app_theme_extension.dart';

// class LocationManager {
//   static final LocationManager _instance = LocationManager._internal();

//   factory LocationManager() {
//     return _instance;
//   }

//   LocationManager._internal();

//   Future<void> checkAndRequestLocationPermission(BuildContext context) async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       showLocationPickerDialog(context);
//       return;
//     }
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission != LocationPermission.whileInUse &&
//           permission != LocationPermission.always) {
//         showPermissionDeniedDialog(context);
//         return;
//       }
//     }

//     // Get location if permission granted
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     debugPrint("Current Location: ${position.latitude}, ${position.longitude}");

//     String address =
//         await getAddressFromLatLng(position.latitude, position.longitude);
//     debugPrint("Current Address: $address");
//   }

//   Future<String> getAddressFromLatLng(double latitude, double longitude) async {
//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(latitude, longitude);
//       Placemark place = placemarks.first;
//       return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
//     } catch (e) {
//       debugPrint("Error getting address: $e");
//       return "Unknown Location";
//     }
//   }

//   void showPermissionDeniedDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Location Permission Denied'),
//           content: const Text(
//               'Location access is needed to show nearby doctors and clinics. Please enable it from your app settings.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Geolocator.openAppSettings();
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Go to Settings'),
//             ),
//           ],
//         );
//       },
//     );

//     void showLocationPickerDialog(BuildContext content) {
//       showModalBottomSheet(
//         backgroundColor: context.scaffoldBackgroundColor,
//         context: context,
//         builder: (context) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Why We Need Your Location",
//                   style: boldTextStyle(),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "We use your current location to show nearby doctors and clinics for easier appointment booking, provide location-based recommendations, and offer services specific to your area.",
//                   textAlign: TextAlign.center,
//                   style: primaryTextStyle(),
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () async {
//                     Navigator.pop(context);
//                     await checkAndRequestLocationPermission(context);
//                   },
//                   child: const Text("Grant Location Access"),
//                 ),
//                 const SizedBox(height: 8),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Maybe Later"),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }
//   }
// }
