import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../domain/appointment_list_model.dart';

class AppointmentListItem extends StatelessWidget {
  const AppointmentListItem({super.key, required this.appointmentList});
  final AppointmentListModel appointmentList;

  @override
  Widget build(BuildContext context) {
    String dateStr = appointmentList.appointmentDate;
    String timeStr = appointmentList.appointmentTime;
    final appointmentfilter =
        DateTime.parse('$dateStr $timeStr').isBefore(DateTime.now());
    return Container(
      foregroundDecoration: (appointmentfilter)
          ? BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
              backgroundBlendMode: BlendMode.saturation,
            )
          : null,
      height: 170,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.appointmentCard,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircularProfileAvatar(
                        appointmentList.doctorImage,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeHolder: (context, url) => const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        cacheImage: true,
                        showInitialTextAbovePicture: false,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            appointmentList.doctorName,
                            style: GoogleFonts.inter(
                              fontSize: Sizes.s20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondary,
                            ),
                          ),
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            appointmentList.doctorCategory,
                            style: GoogleFonts.inter(
                              fontSize: Sizes.s14,
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.primary.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.calendar_month_outlined,
                                size: 20,
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              appointmentList.appointmentDate,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.access_time_outlined,
                                size: 20,
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              appointmentList.appointmentTime,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Patient ${appointmentList.patientName}',
                        style: GoogleFonts.inter(
                          fontSize: Sizes.s16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondary,
                        ),
                      ),
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
