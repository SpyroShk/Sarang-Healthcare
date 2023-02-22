import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/app_color.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';

import '../../domain/appointment_list_model.dart';

class AppointmentType extends StatelessWidget {
  const AppointmentType({super.key, required this.appointment});
  final AppointmentListModel appointment;

  @override
  Widget build(BuildContext context) {
    String dateStr = appointment.appointmentDate;
    String timeStr = appointment.appointmentTime;
    return Text(
      appointmentTime(DateTime.parse('$dateStr $timeStr')),
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: Sizes.s16,
        color: AppColor.black,
      ),
    );
  }

  String appointmentTime(DateTime d) {
    log(DateTime.now().toString());
    if (d.isBefore(DateTime.now())) {
      return 'Previous';
    } else {
      return 'Upcoming';
    }
  }
}
