import 'package:flutter/material.dart';
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
        context.pushReplacement(AppRoutes.docappointment,
            extra: preferredDoctor);
      },
      child: Container(
        padding: const EdgeInsets.all(30),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.primary.withOpacity(0.1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeadingIcon(preferredDoctor: preferredDoctor),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    PreferredDoctorTitle(preferredDoctor: preferredDoctor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
