import 'package:flutter/material.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/hospital/presentation/screens/hospital_details_screen.dart';

class DocOfHospitalCard extends StatelessWidget {
  final Doctor doctor;
  const DocOfHospitalCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(doctor.image),
            ),
            const SizedBox(height: 10),
            Text(doctor.name, style: boldTextStyle()),
            Text(doctor.specialist),
            Text("Education: ${doctor.education}"),
            Text("Experience: ${doctor.experience}"),
            Text("Price: ${doctor.price}"),
            Text("Distance: ${doctor.distance}"),
          ],
        ),
      ),
    );
  }
}
