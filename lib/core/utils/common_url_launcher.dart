import 'package:url_launcher/url_launcher.dart';

class CommonUrlLauncher {
  CommonUrlLauncher._();

  static final CommonUrlLauncher instance = CommonUrlLauncher._();

  factory CommonUrlLauncher() {
    return instance;
  }

  /// Open Google Maps with source and destination coordinates
  Future<void> openGoogleMaps({
    required double sourceLat,
    required double sourceLng,
    required double destinationLat,
    required double destinationLng,
  }) async {
    final String googleMapsUrl =
        "https://www.google.com/maps/dir/?api=1&origin=$sourceLat,$sourceLng&destination=$destinationLat,$destinationLng&travelmode=driving";

    try {
      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        await launchUrl(Uri.parse(googleMapsUrl),
            mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch Google Maps';
      }
    } catch (e) {
      print('Error launching Google Maps: $e');
    }
  }
}
