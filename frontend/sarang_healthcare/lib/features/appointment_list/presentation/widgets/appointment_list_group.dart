import 'package:flutter/material.dart';
import 'package:sarang_healthcare/features/appointment_list/domain/appointment_list_model.dart';

import '../../../../core/presentation/theme/sizes.dart';
import 'appointment_list_item.dart';
import 'appointment_type.dart';

class AppointmentListGroup extends StatelessWidget {
  final List<AppointmentListModel> appointmentListGroup;
  const AppointmentListGroup({
    Key? key,
    required ScrollController scrollController,
    required this.appointmentListGroup,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return appointmentListGroup.isEmpty
        ? const Center(
            child: Text(
              'No Doctor Appointments Yet!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s32,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 130,
            ),
            controller: _scrollController,
            itemBuilder: (context, index) {
              int reversedIndex = appointmentListGroup.length - 1 - index;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0
                      ? Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: AppointmentType(
                                  appointment:
                                      appointmentListGroup[reversedIndex]),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )
                      : const SizedBox(
                          height: 7,
                        ),
                  AppointmentListItem(
                    appointmentList: appointmentListGroup[reversedIndex],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 18,
              );
            },
            itemCount: appointmentListGroup.length,
          );
  }
}
