import 'package:flutter/material.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/decoration_widget.dart';

class AppointmentCardWidget extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String appointmentDate;
  final String appointmentTime;
  final String doctorImage;

  const AppointmentCardWidget({
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
          // Vertical Green Border
          Positioned(
            left: 0,
            top: 10,
            bottom: 10,
            child: Container(
              width: 5,
              decoration: BoxDecoration(
                color: AppColor.primaryColor, // Vertical green border
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Appointment Label
                const Text(
                  "Appointment",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 6),

                // Appointment Date & Time
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      appointmentDate,
                      style:
                          TextStyle(fontSize: 13, color: Colors.grey.shade700),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.access_time, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      appointmentTime,
                      style:
                          TextStyle(fontSize: 13, color: Colors.grey.shade700),
                    ),
                  ],
                ),

                10.sHeight,
                const Divider(height: 1, color: AppColor.pinkColor), // Divider

                10.sHeight,

                // Doctor Info Row
                Row(
                  children: [
                    // Doctor Image
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(doctorImage),
                    ),
                    const SizedBox(width: 12),

                    // Doctor Details
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
