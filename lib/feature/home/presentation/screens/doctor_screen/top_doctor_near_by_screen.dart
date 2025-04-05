import 'package:flutter/cupertino.dart';

import 'package:quick_opd/core/themes/horizontal_list.dart';
import 'package:quick_opd/feature/home/presentation/widgets/popular_doctor_card_widget.dart';
import 'package:quick_opd/feature/home/presentation/widgets/heading_with_btn_widget.dart';

class TopDoctorNearByScreen extends StatelessWidget {
  const TopDoctorNearByScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadingWithBtnWidget(
          title: 'Popular Doctors Nearby',
          buttonText: "View All",
        ),
        HorizontalList(
          itemCount: 10,
          itemBuilder: (context, index) => const PopularDoctorCardWidget(
            doctorName: "Dr. Pawane Kumar",
            specialty: "Heart",
            appointmentDate: "27 June 2025",
            appointmentTime: "12:00 am",
            doctorImage:
                "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
          ),
        ),
      ],
    );
  }
}
