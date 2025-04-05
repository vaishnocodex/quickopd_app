import 'package:flutter/material.dart';
import 'package:quick_opd/feature/hospital/presentation/screens/hospital_details_screen.dart';

class SimilarHospitalCard extends StatelessWidget {
  final Hospital hospital;
  SimilarHospitalCard({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(left: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(hospital.image, height: 80, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(hospital.name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(hospital.location),
            Text("Rating: ${hospital.rating}"),
            Text(hospital.bedsAvailable),
          ],
        ),
      ),
    );
  }
}
