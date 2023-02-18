import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../../preferred_doctor/domain/preferred_doctor_model.dart';

class PreferredDoctorCard extends StatelessWidget {
  const PreferredDoctorCard({
    super.key,
    required this.preferredDoctor,
    this.controller,
    this.validator,
  });
  final PreferredDoctorModel? preferredDoctor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.primary.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProfileAvatar(
            preferredDoctor?.image ?? '',
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeHolder: (context, url) => const SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(),
            ),
            radius: 50,
            backgroundColor: Colors.transparent,
            cacheImage: true,
            initialsText: const Text(
              'Doc\nImage',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 8),
                  TextFormField(
                    showCursor: false,
                    readOnly: true,
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: controller,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.inter(
                      fontSize: Sizes.s20,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: validator,
                  ),
                  // Text(
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  //   preferredDoctor?.name ?? 'Doctor',
                  //   style: GoogleFonts.inter(
                  //     fontSize: Sizes.s20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    preferredDoctor?.qualifications ?? 'Qualification',
                    style: GoogleFonts.inter(
                      fontSize: Sizes.s14,
                      color: AppColor.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
