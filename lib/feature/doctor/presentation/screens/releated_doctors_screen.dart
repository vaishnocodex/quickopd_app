import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/horizontal_list.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/releated_doctor_card_widget.dart';

class ReleatedDoctorsScreen extends StatelessWidget {
  const ReleatedDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Also NearBy Doctors",
          style: boldTextStyle(size: 18),
        ),
        8.sHeight,
        HorizontalList(
          itemCount: 10,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          runSpacing: 8,
          spacing: 8,
          itemBuilder: (context, index) => const ReleatedDoctorCardWidget(
            doctorName: "Dr. Pawane Kumar",
            specialty: "Heart",
            doctorImage:
                "https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg",
          ),
        ),
      ],
    );
  }
}
