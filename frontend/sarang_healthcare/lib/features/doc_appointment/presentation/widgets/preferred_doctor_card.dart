import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sarang_healthcare/core/shared/api_constants.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../../preferred_doctor/domain/preferred_doctor_model.dart';

class PreferredDoctorCard extends StatelessWidget {
  const PreferredDoctorCard({
    super.key,
    required this.preferredDoctor,
  });
  final PreferredDoctorModel preferredDoctor;

  @override
  Widget build(BuildContext context) {
    DateTime to = DateTime.parse("2023-03-05 ${preferredDoctor.availableTo}");
    String formattedTo = DateFormat('HH:mm').format(to);
    DateTime from =
        DateTime.parse("2023-03-05 ${preferredDoctor.availableFrom}");
    String formattedFrom = DateFormat('HH:mm').format(from);
    return Container(
      padding: const EdgeInsets.all(20),
      height: 151,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.primary.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProfileAvatar(
            "${ApiConstants.baseUrl}/media/${preferredDoctor.image}",
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeHolder: (context, url) => const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
            radius: 45,
            backgroundColor: Colors.transparent,
            cacheImage: true,
            initialsText: const Text(
              'Doc\nImage',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  '${preferredDoctor.firstName} ${preferredDoctor.lastName}',
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
                  preferredDoctor.qualifications,
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
            ),
          ),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
