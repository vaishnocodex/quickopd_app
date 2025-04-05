import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';

class PopularDoctorCardWidget extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String appointmentDate;
  final String appointmentTime;
  final String doctorImage;

  const PopularDoctorCardWidget({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.doctorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 6, 0),
      decoration: DecorationWidget.boxDecorationWithShadow(
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 9,
            bottom: 9,
            child: Container(
              width: 5,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(doctorImage),
                ),
                12.sWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      specialty,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          appointmentDate,
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          appointmentTime,
                          style: TextStyle(
                              fontSize: 13, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
