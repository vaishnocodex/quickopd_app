import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_opd/core/common/common_list_wrapper.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/doctor_card_widget.dart';
import 'package:quick_opd/routes/app_route_path.dart';

class DoctorListScreen extends StatelessWidget {
  DoctorListScreen({super.key});

  final List<Doctor> doctors = [
    Doctor(
        name: "Dr. Jenny Wilson",
        specialization: "Neurologist",
        experience: "5+ years experience",
        availability: "16 Jan | 10:00 AM - 06:00 PM",
        imageUrl:
            "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg"),
    Doctor(
      name: "Dr. Robert Fox",
      specialization: "Dentist",
      experience: "5+ years experience",
      availability: "Available for your need",
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
    ),
    Doctor(
      name: "Dr. Jenny Wilson",
      specialization: "Cardiology",
      experience: "5+ years experience",
      availability: "16 Jan | 10:00 AM - 06:00 PM",
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
    ),
    Doctor(
      name: "Dr. Esther Howard",
      specialization: "Orthopedic",
      experience: "5+ years experience",
      availability: "Available for your need",
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
    ),
    Doctor(
      name: "Dr. Aileen Fullbright",
      specialization: "Optometric",
      experience: "5+ years experience",
      availability: "Available for your need",
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Available Doctors",
          style: boldTextStyle(size: 20),
        ),
      ),
      body: CommonListWrapper<Doctor>(
        physics: const BouncingScrollPhysics(),
        listType: ListType.gridView,
        gridSpacing: 0,
        gridCrossAxisCount: 1,
        items: doctors,
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.doctorsDetailsScreen.name);
            },
            child: DoctorCardWidget(
              imageUrl: item.imageUrl,
              name: item.name,
              specialization: item.specialization,
              experience: item.experience,
              availability: item.availability,
            ),
          );
        },
      ),

      // ListView.builder(
      //   itemCount: doctors.length,
      //   itemBuilder: (context, index) {
      //     final doctor = doctors[index];
      //     return GestureDetector(
      //       onTap: () {
      //         context.pushNamed(AppRoute.doctorsDetailsScreen.name);
      //       },
      //       child: DoctorCardWidget(
      //         imageUrl: doctor.imageUrl,
      //         name: doctor.name,
      //         specialization: doctor.specialization,
      //         experience: doctor.experience,
      //         availability: doctor.availability,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

class Doctor {
  final String name;
  final String specialization;
  final String experience;
  final String availability;
  final String imageUrl;

  Doctor({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.availability,
    required this.imageUrl,
  });
}
