import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sarang_healthcare/core/presentation/theme/app_color.dart';

import '../../../../../core/presentation/theme/sizes.dart';
import '../../../domain/preferred_doctor_model.dart';

class PreferredDoctorTitle extends StatefulWidget {
  const PreferredDoctorTitle({super.key, required this.preferredDoctor});
  final PreferredDoctorModel preferredDoctor;

  @override
  State<PreferredDoctorTitle> createState() => _PreferredDoctorTitleState();
}

class _PreferredDoctorTitleState extends State<PreferredDoctorTitle> {
  @override
  Widget build(BuildContext context) {
    DateTime to =
        DateTime.parse("2023-03-05 ${widget.preferredDoctor.availableTo}");
    String formattedTo = DateFormat('HH:mm').format(to);
    DateTime from =
        DateTime.parse("2023-03-05 ${widget.preferredDoctor.availableFrom}");
    String formattedFrom = DateFormat('HH:mm').format(from);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          'Dr. ${widget.preferredDoctor.firstName} ${widget.preferredDoctor.lastName}',
          style: GoogleFonts.inter(
            fontSize: Sizes.s20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          widget.preferredDoctor.qualifications,
          style: GoogleFonts.inter(
            fontSize: Sizes.s14,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          "Available from $formattedFrom",
          style: GoogleFonts.inter(
            fontSize: Sizes.s12,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          "Available to $formattedTo",
          style: GoogleFonts.inter(
            fontSize: Sizes.s12,
            color: AppColor.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
