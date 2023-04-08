import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/route/app_router.dart';
import '../../../../core/presentation/theme/app_color.dart';
import '../../domain/preferred_doctor_model.dart';
import 'components/leading_icon.dart';
import 'components/preferred_doctor_title.dart';

class PreferredDoctorListItem extends StatelessWidget {
  const PreferredDoctorListItem({super.key, required this.preferredDoctor});
  final PreferredDoctorModel preferredDoctor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        context.push(AppRoutes.docappointment, extra: preferredDoctor);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 151,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.primary.withOpacity(0.1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: LeadingIcon(preferredDoctor: preferredDoctor)),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PreferredDoctorTitle(preferredDoctor: preferredDoctor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
