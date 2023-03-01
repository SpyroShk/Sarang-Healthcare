import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          widget.preferredDoctor.name,
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
      ],
    );
  }
}
