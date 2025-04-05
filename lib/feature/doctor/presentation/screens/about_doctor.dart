import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';
import 'package:quick_opd/feature/doctor/presentation/screens/releated_doctors_screen.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/text_with_bullet_widget.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(bottom: 0, top: 20),
      decoration: DecorationWidget.boxDecorationDefault(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headingWidget("About the Doctor"),
              12.sHeight,
              Text(
                "Dr. Sarah Mitchell is a highly skilled and compassionate general physician with over 15 years of experience in providing exceptional medical care. Dedicated to patient well-being, Dr. Mitchell combines expertise with a patient-centered approach, ensuring personalized treatment and support for every individual.\nWith a specialization in internal medicine, she focuses on diagnosing and treating a wide range of health conditions, from common illnesses to chronic diseases. Dr. Mitchell stays updated with the latest advancements in medical research and technology to provide the best possible care to her patients.\nHer clinic, located in the heart of the city, offers a warm and welcoming environment where patients feel comfortable and cared for. Beyond treatment, Dr. Mitchell emphasizes preventive healthcare, helping individuals lead healthier and happier lives.\nWith a passion for healing and a commitment to excellence, Dr. Mitchell and her team strive to make healthcare accessible, efficient, and patient-friendly.",
                style: secondaryTextStyle(size: 14),
              ),
              16.sHeight,
              headingWidget("Currently Working at"),
              12.sHeight,
              Text(
                "Apollo Hospital, Delhi",
                style: boldTextStyle(size: 14),
              ),
              Text(
                "Sarita Vihar, Delhi Mathura Road,\nNew Delhi, Delhi 110076, India",
                style: secondaryTextStyle(size: 14),
              ),
              16.sHeight,
              headingWidget("Specializations"),
              12.sHeight,
              const TextWithBulletWidget(
                items: ['Cardiology', 'Neurology', 'Dermatology'],
                bulletIcon: Icons.star,
                iconColor: Colors.orange,
              ),
              20.sHeight,
              const ReleatedDoctorsScreen(),
              30.sHeight,
            ],
          ),
        ),
      ),
    );
  }

  Widget headingWidget(String title) {
    return Text(
      title,
      style: boldTextStyle(size: 18),
    );
  }
}
