import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/utils/remote_image.dart';
import 'package:quick_opd/feature/hospital/presentation/widgets/doc_of_hospital_card.dart';
import 'package:quick_opd/feature/hospital/presentation/widgets/hospital_card.dart';

class HospitalDetailsScreen extends StatelessWidget {
  HospitalDetailsScreen({super.key});
  final List<Doctor> doctors = List.generate(
    10,
    (index) => Doctor(
      name: "Dr. John Doe $index",
      specialist: "Cardiologist",
      education: "MBBS, MD",
      experience: "${5 + index} years",
      price: "\$${100 + (index * 10)}",
      distance: "${2 + index} km",
      image: "assets/doctor.jpg",
    ),
  );

  final List<Hospital> hospitals = List.generate(
    5,
    (index) => Hospital(
      name: "Hospital ${index + 1}",
      location: "City ${index + 1}",
      rating: "${4.0 + (index * 0.2)}",
      bedsAvailable: "${50 + (index * 10)} beds",
      image: "assets/hospital.jpg",
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hospital Details")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hospital Banner

            remoteImageWidget(
                "https://www.patriotcares.com/wp-content/uploads/2024/11/Mease-Countryside-Hospital-Tower-730x400-sept-2023.jpg",
                200),

            20.sHeight,

            // Doctors List (Grid)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Our Doctors", style: boldTextStyle(size: 18)),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return DocOfHospitalCard(doctor: doctors[index]);
              },
            ),

            // Hospital Description
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About the Hospital",
                    style: boldTextStyle(size: 18),
                  ),
                  8.sHeight,
                  Text(
                    "Our hospital provides world-class facilities with top doctors and advanced technology. "
                    "We are committed to offering the best healthcare services.",
                    style: primaryTextStyle(),
                  ),
                ],
              ),
            ),

            // Similar Hospitals List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Similar Hospitals",
                style: boldTextStyle(size: 18),
              ),
            ),
            10.sHeight,
            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  return SimilarHospitalCard(hospital: hospitals[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Doctor {
  final String name, specialist, education, experience, price, distance, image;
  Doctor({
    required this.name,
    required this.specialist,
    required this.education,
    required this.experience,
    required this.price,
    required this.distance,
    required this.image,
  });
}

class Hospital {
  final String name, location, rating, bedsAvailable, image;
  Hospital({
    required this.name,
    required this.location,
    required this.rating,
    required this.bedsAvailable,
    required this.image,
  });
}
