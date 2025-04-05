import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/common/common_list_wrapper.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/hospital/presentation/widgets/hospital_card_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';

class HospitalListScreen extends StatelessWidget {
  const HospitalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "NearBy Hospitals",
          style: boldTextStyle(size: 18),
        ),
      ),
      body: CommonListWrapper<Hospital>(
        items: hospitalList,
        listType: ListType.gridView,
        gridCrossAxisCount: 1,
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () => context.pushNamed(AppRoute.hospitalDetailsScreen.name),
            child: HospitalCardWidget(
              item: item,
              imageURL: (data) => data.image,
              name: (data) => data.name,
              address: (data) => data.address,
              rating: (data) => "${data.rating}",
              location: (data) => data.location,
              status: (data) => data.status,
              distance: (data) => "${data.distance}",
            ),
          );
        },
      ),
    );
  }
}

class Hospital {
  final String image;
  final String name;
  final String address;
  final double rating;
  final String location;
  final String status;
  final double distance;

  Hospital({
    required this.image,
    required this.name,
    required this.address,
    required this.rating,
    required this.location,
    required this.status,
    required this.distance,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      location: json['location'] ?? '',
      status: json['status'] ?? 'Closed',
      distance: (json['distance'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'address': address,
      'rating': rating,
      'location': location,
      'status': status,
      'distance': distance,
    };
  }
}

List<Hospital> hospitalList = [
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'City Medical Center',
    address: '123 Main Street, NY',
    rating: 4.5,
    location: '40.7128° N, 74.0060° W',
    status: 'Open',
    distance: 2.5,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Green Valley Hospital',
    address: '456 Elm Street, CA',
    rating: 4.2,
    location: '34.0522° N, 118.2437° W',
    status: 'Closed',
    distance: 1.2,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Sunrise Health Clinic',
    address: '789 Oak Avenue, TX',
    rating: 4.8,
    location: '29.7604° N, 95.3698° W',
    status: 'Open',
    distance: 3.8,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Hope General Hospital',
    address: '321 Birch Road, FL',
    rating: 3.9,
    location: '25.7617° N, 80.1918° W',
    status: 'Open',
    distance: 4.1,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Wellness Care Center',
    address: '567 Pine Street, IL',
    rating: 4.7,
    location: '41.8781° N, 87.6298° W',
    status: 'Closed',
    distance: 5.0,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Metro City Hospital',
    address: '890 Cedar Lane, AZ',
    rating: 4.3,
    location: '33.4484° N, 112.0740° W',
    status: 'Open',
    distance: 1.7,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Silver Oak Hospital',
    address: '432 Willow Blvd, CO',
    rating: 4.1,
    location: '39.7392° N, 104.9903° W',
    status: 'Closed',
    distance: 2.9,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Hilltop Medical Center',
    address: '876 Maple Drive, WA',
    rating: 4.6,
    location: '47.6062° N, 122.3321° W',
    status: 'Open',
    distance: 6.3,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Oceanview Health Center',
    address: '654 Bay Street, OR',
    rating: 4.0,
    location: '45.5051° N, 122.6750° W',
    status: 'Closed',
    distance: 7.5,
  ),
  Hospital(
    image:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Hospital-de-Bellvitge.jpg/640px-Hospital-de-Bellvitge.jpg',
    name: 'Mountain Ridge Hospital',
    address: '210 Summit Ave, NV',
    rating: 4.9,
    location: '36.1699° N, 115.1398° W',
    status: 'Open',
    distance: 8.2,
  ),
];
