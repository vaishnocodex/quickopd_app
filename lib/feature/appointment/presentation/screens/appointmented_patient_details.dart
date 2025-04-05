import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_color.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/appointment/presentation/bloc_cubit/appoinment_toggle_cubit/appointment_toggle_cubit.dart';

class AppointmentedPatientDetails extends StatelessWidget {
  const AppointmentedPatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details',style: boldTextStyle(size: 20),),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.sHeight,
             Text('Who is this appointment for?',
                style: boldTextStyle(size: 18)),
            BlocBuilder<AppointmentToggleCubit, bool>(
              builder: (context, isForMyself) {
                return Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isForMyself,
                      onChanged: (value) {
                        context.read<AppointmentToggleCubit>().toggle(true);
                      },
                    ),
                    const Text('For Myself'),
                    Radio(
                      value: false,
                      groupValue: isForMyself,
                      onChanged: (value) {
                        context.read<AppointmentToggleCubit>().toggle(false);
                      },
                    ),
                    const Text('For Someone Else'),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            const Text('Confirm Your Details',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildTextField('Full Name', 'Gustavo Fring'),
            Row(
              children: [
                Expanded(child: _buildTextField('Gender', 'Male')),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField('Age', '51')),
              ],
            ),
            _buildTextField('Mobile Number', '+44 7700 900123'),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Edit Details'),
            ),
            const Spacer(),
            const Text('Consultation Fee',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('£55 per session',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String value) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        enabled: false,
      ),
      controller: TextEditingController(text: value),
    );
  }
}
